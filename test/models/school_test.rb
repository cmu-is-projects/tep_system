require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  should have_many(:teachers)
 
end
