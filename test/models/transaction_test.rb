require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  
  # test relationships
  should belong_to(:user)
  should belong_to(:teacher)

  # test validations with matchers
  should validate_presence_of(:user)
  should validate_presence_of(:teacher)
  should validate_presence_of(:date_entered)
  should allow_value(Date.current).for(:shopping_date)
  should allow_value(2.days.ago.to_date).for(:shopping_date)
  should_not allow_value(2.days.from_now.to_date).for(:shopping_date)
  #should allow_value(Date.current).for(:date_entered) #fails because need shopping_date
  #should allow_value(2.days.ago.to_date).for(:date_entered) #fails because need shopping_date
  should_not allow_value(2.days.from_now.to_date).for(:date_entered)

  # set up context
  context "Within context" do
    setup do
      create_schools
      create_users
      create_teachers
      create_transactions
    end
    
    teardown do
      destroy_schools
      destroy_users
      destroy_teachers
      destroy_transactions
    end


    should "check to make sure the date_entered is on or after the shopping_date" do
      @good_date1 = FactoryBot.build(:transaction, user: @user, teacher: @teacher, date_entered: Date.current, shopping_date: Date.current)
      @good_date1.valid?

      @good_date2 = FactoryBot.build(:transaction, user: @user, teacher: @teacher, date_entered: Date.current, shopping_date: 1.day.ago.to_date)
      @good_date2.valid?

      @bad_date = FactoryBot.build(:transaction, user: @user, teacher: @teacher, date_entered: 1.day.ago.to_date, shopping_date: Date.current)
      deny @bad_date.valid?
    end 

#Questionable Test
    should "check to make sure that date_entered on creation is today's date" do
      @trans = FactoryBot.build(:transaction, user: @user, teacher: @teacher, shopping_date: 10.days.ago.to_date)
      assert_equal Date.current, @trans.date_entered
    end

    should "have a working scope called for_shopping_date" do
        assert_equal [3.days.ago.to_date, Date.current], Transaction.for_shopping_date(5.days.ago.to_date).all.map(&:date_entered).sort
    end

    should "have a working scope called for_date_entered" do
        assert_equal [5.days.ago.to_date], Transaction.for_date_entered(3.days.ago.to_date).all.map(&:shopping_date).sort
    end

    should "have a working scope called for_teacher" do
        assert_equal 3, Transaction.for_teacher(@teacher).all.map(&:shopping_date).count
    end

    should "have a working scope called shop_chronological" do
        assert_equal [Date.current, 5.days.ago.to_date, 5.days.ago.to_date], Transaction.shop_chronological.all.map(&:shopping_date)
    end

    should "have a working scope called enter_chronological" do
        assert_equal [Date.current, Date.current, 3.days.ago.to_date], Transaction.enter_chronological.all.map(&:date_entered)
    end

    should "have a working scope called uploaded" do
        assert_equal 1, Transaction.uploaded.all.count
    end

    should "have a working scope called not_uploaded" do
        assert_equal 2, Transaction.not_uploaded.all.count
    end

  end

end
