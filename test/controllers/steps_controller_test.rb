require 'test_helper'

class StepsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get steps_new_url
    assert_response :success
  end

  test "should get create" do
    get steps_create_url
    assert_response :success
  end

  test "should get edit" do
    get steps_edit_url
    assert_response :success
  end

  test "should get save" do
    get steps_save_url
    assert_response :success
  end

  test "should get update" do
    get steps_update_url
    assert_response :success
  end

  test "should get destroy" do
    get steps_destroy_url
    assert_response :success
  end

end
