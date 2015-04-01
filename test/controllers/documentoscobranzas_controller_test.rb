require 'test_helper'

class DocumentoscobranzasControllerTest < ActionController::TestCase
  setup do
    @documentoscobranza = documentoscobranzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documentoscobranzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documentoscobranza" do
    assert_difference('Documentoscobranza.count') do
      post :create, documentoscobranza: {  }
    end

    assert_redirected_to documentoscobranza_path(assigns(:documentoscobranza))
  end

  test "should show documentoscobranza" do
    get :show, id: @documentoscobranza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documentoscobranza
    assert_response :success
  end

  test "should update documentoscobranza" do
    patch :update, id: @documentoscobranza, documentoscobranza: {  }
    assert_redirected_to documentoscobranza_path(assigns(:documentoscobranza))
  end

  test "should destroy documentoscobranza" do
    assert_difference('Documentoscobranza.count', -1) do
      delete :destroy, id: @documentoscobranza
    end

    assert_redirected_to documentoscobranzas_path
  end
end
