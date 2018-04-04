require 'test_helper'

class ItemTest < ActiveSupport::TestCase
	should have_many(:order_items)

	should validate_presence_of(:name)
	should validate_presence_of(:max_packs)
	should validate_presence_of(:qty_per_unit)

	should allow_value(1).for(:max_packs)
	should allow_value(10).for(:max_packs)
	should allow_value(125001).for(:max_packs)
	should_not allow_value(nil).for(:max_packs)
	should_not allow_value(-2).for(:max_packs)
	should_not allow_value("bad").for(:max_packs)
	should_not allow_value(1.5).for(:max_packs)

	should allow_value(1).for(:qty_per_unit)
	should allow_value(10).for(:qty_per_unit)
	should allow_value(125001).for(:qty_per_unit)
	should_not allow_value(nil).for(:qty_per_unit)
	should_not allow_value(-2).for(:qty_per_unit)
	should_not allow_value("bad").for(:qty_per_unit)
	should_not allow_value(1.5).for(:qty_per_unit)

	context "Creating items" do 
		setup do 
			create_items
		end 

		teardown do 
			destroy_items
		end 

		should "show that items are listed in alphabetical order" do
			assert_equal ["Binders", "Erasers", "Notebooks", "Pencils", "Staplers"], Item.alphabetical.map{|i| i.name}
		end 

		should "show that there are three active items" do 
			assert_equal 3, Item.active.size
			assert_equal ["Binders", "Erasers", "Pencils"], Item.active.alphabetical.map{|i| i.name}
		end 

		should "show that there are two inactive items" do 
			assert_equal 2, Item.inactive.size
			assert_equal ["Notebooks", "Staplers"], Item.inactive.alphabetical.map{|i| i.name}
		end 

	end 
end
