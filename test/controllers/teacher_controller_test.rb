require "test_helper"

describe TeacherController do
  it "should get index" do
    get teacher_index_url
    value(response).must_be :success?
  end

end
