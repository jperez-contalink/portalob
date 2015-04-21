module Api
  module V1
    class PedidosobsController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_catalogoproductos"
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_pedido?_where=rfc=%27" + @user.rfc + "%27&_sortBy=creationDate"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Pedidosob.find(params[:id])
      end

      def create
        respond_with Pedidosob.create(params[:product])
      end

      def update
        respond_with Pedidosob.update(params[:id], params[:product])
      end

      def destroy
        respond_with Pedidosob.destroy(params[:id])
      end
    end
  end
end