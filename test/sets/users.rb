module Contexts
  module Users
    # Context for users (assumes no prior contexts)

    def create_users
      @user = FactoryBot.create(:user)
    end

    def destroy_users
      @user.delete
    end

  end
end