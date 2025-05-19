require "test_helper"

class ParsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pars_index_url
    assert_response :success
  end

  test "should get show" do
    get pars_show_url
    assert_response :success
  end

  test "should get new" do
    get pars_new_url
    assert_response :success
  end

  test "should get create" do
    get pars_create_url
    assert_response :success
  end
end
