require 'test_helper'

class PedidolineasControllerTest < ActionController::TestCase
  setup do
    @pedidolinea = pedidolineas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidolineas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedidolinea" do
    assert_difference('Pedidolinea.count') do
      post :create, pedidolinea: { cantidad: @pedidolinea.cantidad, imagen: @pedidolinea.imagen, pedido_id: @pedidolinea.pedido_id, precio: @pedidolinea.precio, product_id: @pedidolinea.product_id, product_value: @pedidolinea.product_value, producto: @pedidolinea.producto, total: @pedidolinea.total }
    end

    assert_redirected_to pedidolinea_path(assigns(:pedidolinea))
  end

  test "should show pedidolinea" do
    get :show, id: @pedidolinea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedidolinea
    assert_response :success
  end

  test "should update pedidolinea" do
    patch :update, id: @pedidolinea, pedidolinea: { cantidad: @pedidolinea.cantidad, imagen: @pedidolinea.imagen, pedido_id: @pedidolinea.pedido_id, precio: @pedidolinea.precio, product_id: @pedidolinea.product_id, product_value: @pedidolinea.product_value, producto: @pedidolinea.producto, total: @pedidolinea.total }
    assert_redirected_to pedidolinea_path(assigns(:pedidolinea))
  end

  test "should destroy pedidolinea" do
    assert_difference('Pedidolinea.count', -1) do
      delete :destroy, id: @pedidolinea
    end

    assert_redirected_to pedidolineas_path
  end
end
