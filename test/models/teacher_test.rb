require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  should belong_to(:school)
end
