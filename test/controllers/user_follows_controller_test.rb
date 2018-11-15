require 'test_helper'

class UserFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_follows_new_url
    assert_response :success
  end

  test "should get create" do
    get user_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_follows_destroy_url
    assert_response :success
  end

end
