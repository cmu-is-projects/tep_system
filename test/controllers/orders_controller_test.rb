require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    @school = FactoryBot.create(:school)
    @teacher = FactoryBot.create(:teacher)
    @order = FactoryBot.create(:order, user: @user, teacher: @teacher)
  end 

  # test "should get index" do
  #   get orders_path
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_order_path(@order)
    assert_response :success
  end

  test "should get new" do
    get new_order_path
    assert_response :success
  end

  test "should get show" do
    get order_path(@order)
    assert_response :success
  end

end