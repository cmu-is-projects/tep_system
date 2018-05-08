require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:orders)

  context "setup users" do
        setup do
            create_users
        end

        teardown do
            destroy_users
        end
  end
end
