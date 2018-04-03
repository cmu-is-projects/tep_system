require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

	setup do 
		@item = FactoryBot.create(:item)
	end 

	 #  test "should get index" do
  #   get items_path
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_item_path
  #   assert_response :success
  # end

  # test "should create owner" do
  #   assert_difference('Owner.count') do
  #     post owners_path, params: { owner: { active: @owner.active, city: @owner.city, email: "eheimann@example.com", first_name: "Eric", last_name: @owner.last_name, phone: @owner.phone, state: @owner.state, street: @owner.street, zip: @owner.zip } }
  #   end

  #   assert_redirected_to owner_path(Owner.last)

  #   post owners_path, params: { owner: { active: @owner.active, city: @owner.city, email: @owner.email, first_name: nil, last_name: @owner.last_name, phone: @owner.phone, state: @owner.state, street: @owner.street, zip: @owner.zip } }
  #   assert_template :new
  # end


  # test "should destroy owner" do
  #   assert_difference('Owner.count', -1) do
  #     delete owner_path(@owner)
  #   end

  #   assert_redirected_to owners_path
  # end
end