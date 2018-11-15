require 'test_helper'

class ProjectFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get project_follows_new_url
    assert_response :success
  end

  test "should get create" do
    get project_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get project_follows_destroy_url
    assert_response :success
  end

end
