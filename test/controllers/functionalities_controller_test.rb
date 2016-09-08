require 'test_helper'

class FunctionalitiesControllerTest < ActionController::TestCase
  setup do
    @functionality = functionalities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:functionalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create functionality" do
    assert_difference('Functionality.count') do
      post :create, functionality: { description: @functionality.description }
    end

    assert_redirected_to functionality_path(assigns(:functionality))
  end

  test "should show functionality" do
    get :show, id: @functionality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @functionality
    assert_response :success
  end

  test "should update functionality" do
    patch :update, id: @functionality, functionality: { description: @functionality.description }
    assert_redirected_to functionality_path(assigns(:functionality))
  end

  test "should destroy functionality" do
    assert_difference('Functionality.count', -1) do
      delete :destroy, id: @functionality
    end

    assert_redirected_to functionalities_path
  end
end
