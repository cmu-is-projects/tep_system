module Contexts
  module Users
    # Context for users (assumes no prior contexts)

    def create_users
      @admin = FactoryGirl.create(:user)
    end

    def destroy_users
      @admin.delete
    end

  end
end