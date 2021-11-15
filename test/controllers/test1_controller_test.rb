require "test_helper"

class Test1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test1_index_url
    assert_response :success
  end
end
