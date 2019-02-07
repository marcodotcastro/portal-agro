require 'test_helper'

class ProdutoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get produto_index_url
    assert_response :success
  end

  test "should get show" do
    get produto_show_url
    assert_response :success
  end

end
