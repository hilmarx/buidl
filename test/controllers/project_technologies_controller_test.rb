require 'test_helper'

class ProjectTechnologiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get project_technologies_new_url
    assert_response :success
  end

  test "should get create" do
    get project_technologies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get project_technologies_destroy_url
    assert_response :success
  end

end
