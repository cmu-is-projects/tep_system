require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:user)
  should belong_to(:teacher)

  # test validations with matchers
  should allow_value(Date.current).for(:shopping_date)
  should allow_value(Date.current - 2.days).for(:shopping_date)
  should_not allow_value(Date.current - 2.days).for(:shopping_date)

end
