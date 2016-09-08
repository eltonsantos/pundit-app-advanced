require 'test_helper'

class ProfileFunctionalitiesControllerTest < ActionController::TestCase
  setup do
    @profile_functionality = profile_functionalities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_functionalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_functionality" do
    assert_difference('ProfileFunctionality.count') do
      post :create, profile_functionality: { functionality_id: @profile_functionality.functionality_id, profile_id: @profile_functionality.profile_id }
    end

    assert_redirected_to profile_functionality_path(assigns(:profile_functionality))
  end

  test "should show profile_functionality" do
    get :show, id: @profile_functionality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_functionality
    assert_response :success
  end

  test "should update profile_functionality" do
    patch :update, id: @profile_functionality, profile_functionality: { functionality_id: @profile_functionality.functionality_id, profile_id: @profile_functionality.profile_id }
    assert_redirected_to profile_functionality_path(assigns(:profile_functionality))
  end

  test "should destroy profile_functionality" do
    assert_difference('ProfileFunctionality.count', -1) do
      delete :destroy, id: @profile_functionality
    end

    assert_redirected_to profile_functionalities_path
  end
end
