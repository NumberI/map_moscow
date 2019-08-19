require 'test_helper'

class MapCenterControllerTest < ActionDispatch::IntegrationTest
  test "should get map_center" do
    get map_center_map_center_url
    assert_response :success
  end

end
