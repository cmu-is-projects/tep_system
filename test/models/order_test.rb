require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  # test relationships
  should belong_to(:user)
  should belong_to(:teacher)
  should have_many(:order_items)
  should have_many(:items).through(:order_items)

  # test validations with matchers
  should validate_presence_of(:user)
  should validate_presence_of(:teacher)
  should allow_value(Date.current).for(:shopping_date)
  should allow_value(2.days.ago.to_date).for(:shopping_date)
  should_not allow_value(2.days.from_now.to_date).for(:shopping_date)
  should allow_value(Date.current).for(:date_entered) 
  should allow_value(2.days.ago.to_date).for(:date_entered) 
  should_not allow_value(2.days.from_now.to_date).for(:date_entered)

  # set up context
  context "Within context" do
    setup do
      create_schools
      create_users
      create_teachers
      create_orders
    end
    
    teardown do
      destroy_orders
      destroy_teachers
      destroy_schools
      destroy_users
    end

    should "check to make sure the date_entered is on or after the shopping_date" do
      @good_date1 = FactoryBot.build(:order, user: @user, teacher: @teacher, date_entered: Date.current, shopping_date: Date.current)
      @good_date1.valid?

      @good_date2 = FactoryBot.build(:order, user: @user, teacher: @teacher, date_entered: Date.current, shopping_date: 1.day.ago.to_date)
      @good_date2.valid?

      @bad_date = FactoryBot.build(:order, user: @user, teacher: @teacher, date_entered: 1.day.ago.to_date, shopping_date: Date.current)
      deny @bad_date.valid?
    end 

    should "check to make sure that date_entered on creation is today's date" do
      @trans = FactoryBot.build(:order, user: @user, teacher: @teacher, shopping_date: 10.days.ago.to_date)
      assert_equal Date.current, @trans.date_entered
    end

    should "have dates default to today" do
      @order1 = FactoryBot.create(:order, user: @user, teacher: @teacher, shopping_date: nil, date_entered: nil)
      assert_equal Date.current, @order1.date_entered
      assert_equal Date.current, @order1.shopping_date

      @order2 = FactoryBot.create(:order, user: @user, teacher: @teacher, shopping_date: 5.days.ago.to_date, date_entered: nil)
      assert_equal Date.current, @order2.date_entered
      assert_equal 5.days.ago.to_date, @order2.shopping_date

      @order3 = FactoryBot.create(:order, user: @user, teacher: @teacher, date_entered: 2.days.ago.to_date, shopping_date: nil)
      assert_equal 2.days.ago.to_date, @order3.date_entered
      assert_equal 2.days.ago.to_date, @order3.shopping_date

      @order1.destroy
      @order2.destroy
      @order3.destroy
    end

    should "have a working scope called for_shopping_date" do
      assert_equal [3.days.ago.to_date, Date.current], Order.for_shopping_date(5.days.ago.to_date).all.map(&:date_entered).sort
    end

    should "have a working scope called for_date_entered" do
      assert_equal [5.days.ago.to_date], Order.for_date_entered(3.days.ago.to_date).all.map(&:shopping_date).sort
    end

    should "have a working scope called for_teacher" do
      assert_equal 3, Order.for_teacher(@teacher).all.map(&:shopping_date).count
    end

    should "have a working scope called shop_chronological" do
      assert_equal [Date.current, 5.days.ago.to_date, 5.days.ago.to_date], Order.shop_chronological.all.map(&:shopping_date)
    end

    should "have a working scope called enter_chronological" do
      assert_equal [Date.current, Date.current, 3.days.ago.to_date], Order.enter_chronological.all.map(&:date_entered)
    end

    should "have a working scope called uploaded" do
      assert_equal 1, Order.uploaded.all.count
    end

    should "have a working scope called not_uploaded" do
      assert_equal 2, Order.not_uploaded.all.count
    end

    should "should set all unuploaded orders to uploaded" do
      Order.set_uploaded
      assert_equal 3, Order.uploaded.all.count
    end

  end

end