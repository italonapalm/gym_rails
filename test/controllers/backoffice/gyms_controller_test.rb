require 'test_helper'

class Backoffice::GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_gyms_index_url
    assert_response :success
  end

end
