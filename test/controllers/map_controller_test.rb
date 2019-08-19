require 'test_helper'

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get map_json" do
    get map_map_json_url
    assert_response :success
  end

end
