require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	setup do 
		@user = FactoryBot.create(:user)
	end 

	test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_path, params: { user: { username: @user.username, active: @user.active, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, role: @user.role, password: @user.password, password_confirmation: @user.password_confirmation } }
  #   end
  #   assert_redirected_to users_path

  #   post users_path, params: { user: { username: nil, active: @user.active, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, role: @user.role, password: @user.password, password_confirmation: @user.password_confirmation } }
  #   assert_template :new
  # end


  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_path(@user)
    end

    assert_redirected_to users_path
  end
end