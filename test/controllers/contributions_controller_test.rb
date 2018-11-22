require 'test_helper'

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  test "should get :destroy" do
    get contributions_:destroy_url
    assert_response :success
  end

end
