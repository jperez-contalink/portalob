module Api
  module V1
    class ImpresionDocumentosController < ApplicationController
      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.DescargaDocumentosPortal?facturaids=#{params[:facturaids]}"
        puts order_link 
        response = RestClient.get order_link
        respond_to do |format|
          format.xml {
              #render xml: response
              send_data(response, :filename => 'TusCFDIS.zip')
            }
    	  end

      end
    end
  end
end