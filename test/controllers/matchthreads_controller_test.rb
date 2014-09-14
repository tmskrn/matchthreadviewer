require 'test_helper'

class MatchthreadsControllerTest < ActionController::TestCase
  test "should get matchthread" do
    get :matchthread
    assert_response :success
  end

end
