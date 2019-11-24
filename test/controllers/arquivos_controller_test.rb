require 'test_helper'

class ArquivosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arquivos_index_url
    assert_response :success
  end

end
