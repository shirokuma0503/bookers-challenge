require 'test_helper'

class SerchControllerTest < ActionDispatch::IntegrationTest
  test "should get serch" do
    get serch_serch_url
    assert_response :success
  end

end
