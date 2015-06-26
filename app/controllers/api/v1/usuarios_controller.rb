module Api
  module V1
    class UsuariosController < ApplicationController
      
      #respond_to :json

      def index
        puts "VALIDAR USUARIOS DE OPENBRAVO"
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        order_link = "http://" + params[:usr] + ":" + params[:pwd] + "@" + "ec2-54-147-241-223.compute-1.amazonaws.com:8080" + "/openbravo/org.openbravo.service.json.jsonrest/pob_catalogoproductos?_startRow=1&_endRow=2"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Producto.find(params[:id])
      end

      def create
        respond_with Producto.create(params[:product])
      end

      def update
        respond_with Producto.update(params[:id], params[:product])
      end

      def destroy
        respond_with Producto.destroy(params[:id])
      end
    end
  end
end