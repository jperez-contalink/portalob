module Api
  module V1
    class CustomersController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_pedido?_where=rfc=%27" + @user.rfc + "%27&_sortBy=creationDate"
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_customer?_sortBy=name"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Customer.find(params[:id])
      end

      def create
        respond_with Customer.create(params[:product])
      end

      def update
        respond_with Customer.update(params[:id], params[:product])
      end

      def destroy
        respond_with Customer.destroy(params[:id])
      end
    end
  end
end