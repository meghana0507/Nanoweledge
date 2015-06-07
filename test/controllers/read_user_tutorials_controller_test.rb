require 'test_helper'

class ReadUserTutorialsControllerTest < ActionController::TestCase
  setup do
    @read_user_tutorial = read_user_tutorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:read_user_tutorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create read_user_tutorial" do
    assert_difference('ReadUserTutorial.count') do
      post :create, read_user_tutorial: { tutorial_id: @read_user_tutorial.tutorial_id, user_id: @read_user_tutorial.user_id }
    end

    assert_redirected_to read_user_tutorial_path(assigns(:read_user_tutorial))
  end

  test "should show read_user_tutorial" do
    get :show, id: @read_user_tutorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @read_user_tutorial
    assert_response :success
  end

  test "should update read_user_tutorial" do
    patch :update, id: @read_user_tutorial, read_user_tutorial: { tutorial_id: @read_user_tutorial.tutorial_id, user_id: @read_user_tutorial.user_id }
    assert_redirected_to read_user_tutorial_path(assigns(:read_user_tutorial))
  end

  test "should destroy read_user_tutorial" do
    assert_difference('ReadUserTutorial.count', -1) do
      delete :destroy, id: @read_user_tutorial
    end

    assert_redirected_to read_user_tutorials_path
  end
end
