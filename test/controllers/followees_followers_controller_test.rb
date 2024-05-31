require "test_helper"

class FolloweesFollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get followees_followers_destroy_url
    assert_response :success
  end
end
