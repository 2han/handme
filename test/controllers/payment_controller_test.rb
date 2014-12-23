require 'test_helper'

class PaymentControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get purchase" do
    get :purchase
    assert_response :success
  end

  test "should get purchased" do
    get :purchased
    assert_response :success
  end

end
