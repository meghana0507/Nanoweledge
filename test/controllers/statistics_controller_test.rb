require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test "should get basic" do
    get :basic
    assert_response :success
  end

end
