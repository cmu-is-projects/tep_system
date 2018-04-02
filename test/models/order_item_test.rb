require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:order)
  should belong_to(:item)

  # test validations with matchers
  should validate_presence_of(:order)
  should validate_presence_of(:item)
  should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0)

end
