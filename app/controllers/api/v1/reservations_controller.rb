module Api
  module V1
    class ReservationsController < ApplicationController
      def index
        @user = current_usuario
        #str_products = params[:products]
        #usr.gsub! '@', '%40'
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_reservation?_where=" + params[:products] + "&_sortBy=product"
        order_link.gsub! ' ', '%20'
        order_link.gsub! '\'', '%27'
        puts "ORDER_LINK:", order_link
    	  response = RestClient.get order_link 
        #response = HTTParty.get(order_link);
      	respond_to do |format|
      		format.json {render json: response.body}
    	   end
      end

    end
  end
end