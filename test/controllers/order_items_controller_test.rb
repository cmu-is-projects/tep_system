require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    @school = FactoryBot.create(:school)
    @teacher = FactoryBot.create(:teacher, school: @school)
    @order = FactoryBot.create(:order, user: @user, teacher: @teacher)
    @item = FactoryBot.create(:item)
    @order_item = FactoryBot.create(:order_item, item: @item, order: @order, quantity: 1)
  end 

  test "should get new" do
    get new_order_item_path
    assert_response :success
  end

  # test "should create order item" do 
  #   assert_difference('OrderItem.count') do 
  #     post order_items_path, params: {order_item: {order_id: @item.id, item_id: @order.id, quantity: 2}}
  #   end 

  #   assert_redirected_to orders_path

  #   post order_items_path, params: {order_item: {order_id: nil, item_id: @item.id, quantity: 2}}
  #   assert_template :new
  # end 

  test "should destroy order_item" do
    assert_difference('OrderItem.count', -1) do 
      delete order_item_path(@order_item)
    end  
    assert_redirected_to orders_path
  end 

end