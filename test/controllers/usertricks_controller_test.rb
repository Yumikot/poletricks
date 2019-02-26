require 'test_helper'

class UsertricksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get usertricks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get usertricks_destroy_url
    assert_response :success
  end

end
