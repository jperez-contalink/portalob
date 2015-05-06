require 'test_helper'

class MetodopagosControllerTest < ActionController::TestCase
  setup do
    @metodopago = metodopagos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metodopagos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metodopago" do
    assert_difference('Metodopago.count') do
      post :create, metodopago: {  }
    end

    assert_redirected_to metodopago_path(assigns(:metodopago))
  end

  test "should show metodopago" do
    get :show, id: @metodopago
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metodopago
    assert_response :success
  end

  test "should update metodopago" do
    patch :update, id: @metodopago, metodopago: {  }
    assert_redirected_to metodopago_path(assigns(:metodopago))
  end

  test "should destroy metodopago" do
    assert_difference('Metodopago.count', -1) do
      delete :destroy, id: @metodopago
    end

    assert_redirected_to metodopagos_path
  end
end
