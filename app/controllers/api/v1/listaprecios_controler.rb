module Api
  module V1
    class ListapreciosController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        # ESTE CONTROLADOR NO ESTA EN USO
        if current_usuario.empresa.es_jci == 'Y' 
          order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listapreciosjci?_where=taxid=%27" + @user.rfc + "%27"
        else
          order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listaprecios?_where=taxid=%27" + @user.rfc + "%27"
        end          
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Listaprecio.find(params[:id])
      end

      def create
        respond_with Listaprecio.create(params[:product])
      end

      def update
        respond_with Listaprecio.update(params[:id], params[:product])
      end

      def destroy
        respond_with Listaprecio.destroy(params[:id])
      end
    end
  end
end