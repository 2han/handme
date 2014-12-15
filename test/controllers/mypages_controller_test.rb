require 'test_helper'

class MypagesControllerTest < ActionController::TestCase
  setup do
    @mypage = mypages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mypages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mypage" do
    assert_difference('Mypage.count') do
      post :create, mypage: {  }
    end

    assert_redirected_to mypage_path(assigns(:mypage))
  end

  test "should show mypage" do
    get :show, id: @mypage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mypage
    assert_response :success
  end

  test "should update mypage" do
    patch :update, id: @mypage, mypage: {  }
    assert_redirected_to mypage_path(assigns(:mypage))
  end

  test "should destroy mypage" do
    assert_difference('Mypage.count', -1) do
      delete :destroy, id: @mypage
    end

    assert_redirected_to mypages_path
  end
end
