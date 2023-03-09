require "test_helper"

class ServiceTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_types_index_url
    assert_response :success
  end

  test "should get show" do
    get service_types_show_url
    assert_response :success
  end
end
