require 'test_helper'

class KeywordTutorialsControllerTest < ActionController::TestCase
  setup do
    @keyword_tutorial = keyword_tutorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyword_tutorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyword_tutorial" do
    assert_difference('KeywordTutorial.count') do
      post :create, keyword_tutorial: { keyword_id: @keyword_tutorial.keyword_id, tutorial_id: @keyword_tutorial.tutorial_id }
    end

    assert_redirected_to keyword_tutorial_path(assigns(:keyword_tutorial))
  end

  test "should show keyword_tutorial" do
    get :show, id: @keyword_tutorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keyword_tutorial
    assert_response :success
  end

  test "should update keyword_tutorial" do
    patch :update, id: @keyword_tutorial, keyword_tutorial: { keyword_id: @keyword_tutorial.keyword_id, tutorial_id: @keyword_tutorial.tutorial_id }
    assert_redirected_to keyword_tutorial_path(assigns(:keyword_tutorial))
  end

  test "should destroy keyword_tutorial" do
    assert_difference('KeywordTutorial.count', -1) do
      delete :destroy, id: @keyword_tutorial
    end

    assert_redirected_to keyword_tutorials_path
  end
end
