require 'test_helper'

class ListapreciosControllerTest < ActionController::TestCase
  setup do
    @listaprecio = listaprecios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listaprecios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listaprecio" do
    assert_difference('Listaprecio.count') do
      post :create, listaprecio: {  }
    end

    assert_redirected_to listaprecio_path(assigns(:listaprecio))
  end

  test "should show listaprecio" do
    get :show, id: @listaprecio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listaprecio
    assert_response :success
  end

  test "should update listaprecio" do
    patch :update, id: @listaprecio, listaprecio: {  }
    assert_redirected_to listaprecio_path(assigns(:listaprecio))
  end

  test "should destroy listaprecio" do
    assert_difference('Listaprecio.count', -1) do
      delete :destroy, id: @listaprecio
    end

    assert_redirected_to listaprecios_path
  end
end
