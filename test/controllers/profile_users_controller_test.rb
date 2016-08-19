require 'test_helper'

class ProfileUsersControllerTest < ActionController::TestCase
  setup do
    @profile_user = profile_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_user" do
    assert_difference('ProfileUser.count') do
      post :create, profile_user: { profile_id: @profile_user.profile_id, user_id: @profile_user.user_id }
    end

    assert_redirected_to profile_user_path(assigns(:profile_user))
  end

  test "should show profile_user" do
    get :show, id: @profile_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_user
    assert_response :success
  end

  test "should update profile_user" do
    patch :update, id: @profile_user, profile_user: { profile_id: @profile_user.profile_id, user_id: @profile_user.user_id }
    assert_redirected_to profile_user_path(assigns(:profile_user))
  end

  test "should destroy profile_user" do
    assert_difference('ProfileUser.count', -1) do
      delete :destroy, id: @profile_user
    end

    assert_redirected_to profile_users_path
  end
end
