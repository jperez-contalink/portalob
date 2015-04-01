module Api
  module V1
    class DocumentoscobranzasController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_documentocobranza?_where=taxid=%27" + @user.rfc + "%27"
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Documentoscobranza.find(params[:id])
      end

      def create
        respond_with Documentoscobranza.create(params[:product])
      end

      def update
        respond_with Documentoscobranza.update(params[:id], params[:product])
      end

      def destroy
        respond_with Documentoscobranza.destroy(params[:id])
      end
    end
  end
end