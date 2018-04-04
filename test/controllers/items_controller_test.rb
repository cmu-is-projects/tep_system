require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

	setup do 
		@item = FactoryBot.create(:item)
	end 

	test "should get index" do
    get items_path
    assert_response :success
  end

  test "should get new" do
    get new_item_path
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_path, params: { item: { active: @item.active, name: @item.name, max_packs: @item.max_packs, qty_per_unit: @item.qty_per_unit } }
    end

    assert_redirected_to items_path

    post items_path, params: { item: { active: @item.active, name: nil, max_packs: @item.max_packs, qty_per_unit: @item.qty_per_unit } }
    assert_template :new
  end


  # test "should destroy owner" do
  #   assert_difference('Owner.count', -1) do
  #     delete owner_path(@owner)
  #   end

  #   assert_redirected_to owners_path
  # end
end