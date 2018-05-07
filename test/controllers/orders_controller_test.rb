require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_admin
    @user = FactoryBot.create(:user)
    @school = FactoryBot.create(:school)
    @teacher = FactoryBot.create(:teacher, school: @school)
    @order = FactoryBot.create(:order, user: @user, teacher: @teacher)
    @order2 = FactoryBot.create(:order, user: @user, teacher: @teacher)
    @orders = Order.all
  end 

  test "should get index" do
    get orders_path
    assert_response :success
  end

  test "should get edit" do
    get edit_order_path(@order)
    assert_response :success
  end

  test "should get new" do
    get new_order_path
    assert_response :success
  end

  test "should create order" do 
    assert_difference('Order.count') do 
      post orders_path, params: {order: {user_id: @order.user_id, teacher_id: @order.teacher_id, shopping_date: @order.shopping_date, date_entered: @order.date_entered}}
    end 
    assert_redirected_to order_path(Order.last)

    post orders_path, params: {order: {user_id: nil, teacher_id: @order.teacher_id, shopping_date: @order.shopping_date, date_entered: @order.date_entered}}
    assert_template :new
  end 


  test "should mark order as uploaded" do
    patch upload_path(@orders)
    assert_redirected_to sync_path
  end

  test "should get show" do
    get order_path(@order)
    assert_response :success
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do 
      delete order_path(@order)
    end  
    assert_redirected_to orders_path
  end 

end