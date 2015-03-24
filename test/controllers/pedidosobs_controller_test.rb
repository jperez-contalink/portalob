require 'test_helper'

class PedidosobsControllerTest < ActionController::TestCase
  setup do
    @pedidosob = pedidosobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidosobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedidosob" do
    assert_difference('Pedidosob.count') do
      post :create, pedidosob: {  }
    end

    assert_redirected_to pedidosob_path(assigns(:pedidosob))
  end

  test "should show pedidosob" do
    get :show, id: @pedidosob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedidosob
    assert_response :success
  end

  test "should update pedidosob" do
    patch :update, id: @pedidosob, pedidosob: {  }
    assert_redirected_to pedidosob_path(assigns(:pedidosob))
  end

  test "should destroy pedidosob" do
    assert_difference('Pedidosob.count', -1) do
      delete :destroy, id: @pedidosob
    end

    assert_redirected_to pedidosobs_path
  end
end
