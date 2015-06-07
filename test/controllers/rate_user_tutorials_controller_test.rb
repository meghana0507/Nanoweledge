require 'test_helper'

class RateUserTutorialsControllerTest < ActionController::TestCase
  setup do
    @rate_user_tutorial = rate_user_tutorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rate_user_tutorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rate_user_tutorial" do
    assert_difference('RateUserTutorial.count') do
      post :create, rate_user_tutorial: { score: @rate_user_tutorial.score, tutorial_id: @rate_user_tutorial.tutorial_id, user_id: @rate_user_tutorial.user_id }
    end

    assert_redirected_to rate_user_tutorial_path(assigns(:rate_user_tutorial))
  end

  test "should show rate_user_tutorial" do
    get :show, id: @rate_user_tutorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rate_user_tutorial
    assert_response :success
  end

  test "should update rate_user_tutorial" do
    patch :update, id: @rate_user_tutorial, rate_user_tutorial: { score: @rate_user_tutorial.score, tutorial_id: @rate_user_tutorial.tutorial_id, user_id: @rate_user_tutorial.user_id }
    assert_redirected_to rate_user_tutorial_path(assigns(:rate_user_tutorial))
  end

  test "should destroy rate_user_tutorial" do
    assert_difference('RateUserTutorial.count', -1) do
      delete :destroy, id: @rate_user_tutorial
    end

    assert_redirected_to rate_user_tutorials_path
  end
end
