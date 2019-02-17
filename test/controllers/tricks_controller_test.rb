require 'test_helper'

class TricksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tricks_new_url
    assert_response :success
  end

end
