require 'test_helper'

class ExecutorsControllerTest < ActionController::TestCase
  setup do
    @executor = executors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:executors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create executor" do
    assert_difference('Executor.count') do
      post :create, executor: { name: @executor.name }
    end

    assert_redirected_to executor_path(assigns(:executor))
  end

  test "should show executor" do
    get :show, id: @executor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @executor
    assert_response :success
  end

  test "should update executor" do
    patch :update, id: @executor, executor: { name: @executor.name }
    assert_redirected_to executor_path(assigns(:executor))
  end

  test "should destroy executor" do
    assert_difference('Executor.count', -1) do
      delete :destroy, id: @executor
    end

    assert_redirected_to executors_path
  end
end
