require "test_helper"

class Admin::PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_positions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_positions_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_positions_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_positions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_positions_destroy_url
    assert_response :success
  end
end
