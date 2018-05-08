require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
	setup do 
		login_admin
        @school = FactoryBot.create(:school)
		@teacher = FactoryBot.create(:teacher, school: @school)
	end 

	test "should get index" do 
		get teachers_path
		assert_response :success
	end
end
