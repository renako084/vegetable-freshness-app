require "test_helper"

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get others_new_url
    assert_response :success
  end

  test "should get create" do
    get others_create_url
    assert_response :success
  end
end
