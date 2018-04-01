require "test_helper"

describe SchoolController do
  it "should get index" do
    get school_index_url
    value(response).must_be :success?
  end

end
