require "test_helper"

class TrainTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get train_types_index_url
    assert_response :success
  end

  test "should get show" do
    get train_types_show_url
    assert_response :success
  end
end
