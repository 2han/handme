require 'test_helper'

class MypageControllerTest < ActionController::TestCase
  test "should get applying" do
    get :applying
    assert_response :success
  end

  test "should get applied" do
    get :applied
    assert_response :success
  end

end
