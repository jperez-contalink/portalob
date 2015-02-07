module Api
  module V1
    class ImpresionDocumentosController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.DescargaDocumentosPortal?facturaids=#{params[:facturaids]}"
        response = RestClient.get order_link
        respond_to do |format|
          format.xml {
              #render xml: response
              send_data(response, :filename => 'tusarchivos.zip')
            }
    	  end

      end

      def show
        respond_with ImpresionDocumento.find(params[:id])
      end

      def create
        respond_with ImpresionDocumento.create(params[:product])
      end

      def update
        respond_with ImpresionDocumento.update(params[:id], params[:product])
      end

      def destroy
        respond_with ImpresionDocumento.destroy(params[:id])
      end
    end
  end
end