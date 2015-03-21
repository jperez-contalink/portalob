require 'test_helper'

class EscribepedidosControllerTest < ActionController::TestCase
  setup do
    @escribepedido = escribepedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escribepedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create escribepedido" do
    assert_difference('Escribepedido.count') do
      post :create, escribepedido: {  }
    end

    assert_redirected_to escribepedido_path(assigns(:escribepedido))
  end

  test "should show escribepedido" do
    get :show, id: @escribepedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @escribepedido
    assert_response :success
  end

  test "should update escribepedido" do
    patch :update, id: @escribepedido, escribepedido: {  }
    assert_redirected_to escribepedido_path(assigns(:escribepedido))
  end

  test "should destroy escribepedido" do
    assert_difference('Escribepedido.count', -1) do
      delete :destroy, id: @escribepedido
    end

    assert_redirected_to escribepedidos_path
  end
end
