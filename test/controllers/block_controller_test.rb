require 'test_helper'

class BlockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get block_index_url
    assert_response :success
  end

end
