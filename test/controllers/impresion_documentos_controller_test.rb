require 'test_helper'

class ImpresionDocumentosControllerTest < ActionController::TestCase
  setup do
    @impresion_documento = impresion_documentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impresion_documentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create impresion_documento" do
    assert_difference('ImpresionDocumento.count') do
      post :create, impresion_documento: {  }
    end

    assert_redirected_to impresion_documento_path(assigns(:impresion_documento))
  end

  test "should show impresion_documento" do
    get :show, id: @impresion_documento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @impresion_documento
    assert_response :success
  end

  test "should update impresion_documento" do
    patch :update, id: @impresion_documento, impresion_documento: {  }
    assert_redirected_to impresion_documento_path(assigns(:impresion_documento))
  end

  test "should destroy impresion_documento" do
    assert_difference('ImpresionDocumento.count', -1) do
      delete :destroy, id: @impresion_documento
    end

    assert_redirected_to impresion_documentos_path
  end
end
