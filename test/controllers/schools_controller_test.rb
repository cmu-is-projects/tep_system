require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
	setup do 
		@school = FactoryBot.create(:school)
	end 

	test "should get index" do 
		get schools_path
		assert_response :success
	end

	# TODO: test show
end
