require 'test_helper'

class Api::V1::CheckFodmapsControllerTest < ActionDispatch::IntegrationTest
  test "should get checkingredients" do
    get api_v1_check_fodmaps_checkingredients_url
    assert_response :success
  end

end
