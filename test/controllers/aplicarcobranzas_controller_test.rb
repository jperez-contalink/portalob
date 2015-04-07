require 'test_helper'

class AplicarcobranzasControllerTest < ActionController::TestCase
  setup do
    @aplicarcobranza = aplicarcobranzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aplicarcobranzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aplicarcobranza" do
    assert_difference('Aplicarcobranza.count') do
      post :create, aplicarcobranza: {  }
    end

    assert_redirected_to aplicarcobranza_path(assigns(:aplicarcobranza))
  end

  test "should show aplicarcobranza" do
    get :show, id: @aplicarcobranza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aplicarcobranza
    assert_response :success
  end

  test "should update aplicarcobranza" do
    patch :update, id: @aplicarcobranza, aplicarcobranza: {  }
    assert_redirected_to aplicarcobranza_path(assigns(:aplicarcobranza))
  end

  test "should destroy aplicarcobranza" do
    assert_difference('Aplicarcobranza.count', -1) do
      delete :destroy, id: @aplicarcobranza
    end

    assert_redirected_to aplicarcobranzas_path
  end
end
