module Api
  module V1
    class PoslotesController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_lote?_where=product=%27" + params[:producto_id] + "%27"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Poslote.find(params[:id])
      end

      def create
        respond_with Poslote.create(params[:product])
      end

      def update
        respond_with Poslote.update(params[:id], params[:product])
      end

      def destroy
        respond_with Poslote.destroy(params[:id])
      end
    end
  end
end