require 'test_helper'

class AutosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get autos_index_url
    assert_response :success
  end

end
