require 'test_helper'

class CirandaPopularControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get ciranda_popular_inicio_url
    assert_response :success
  end

end
