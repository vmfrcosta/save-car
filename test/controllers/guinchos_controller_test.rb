require 'test_helper'

class GuinchosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guinchos_index_url
    assert_response :success
  end

end
