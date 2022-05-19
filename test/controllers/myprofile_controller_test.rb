require 'test_helper'

class MyprofileControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get myprofile_edit_url
    assert_response :success
  end

  test "should get show" do
    get myprofile_show_url
    assert_response :success
  end

  test "should get update" do
    get myprofile_update_url
    assert_response :success
  end

end
