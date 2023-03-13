require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get set_preferences" do
    get profiles_set_preferences_url
    assert_response :success
  end
end
