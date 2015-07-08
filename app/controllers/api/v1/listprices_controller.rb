module Api
  module V1
    class ListpricesController < ApplicationController
      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/BusinessPartner?_where=id=%27" + @user.partner_id + "%27"
        #ec2-54-147-232-23.compute-1.amazonaws.com:8080/openbravo/org.openbravo.service.json.jsonrest/BusinessPartner?_where=id=%27%27
        puts order_link
    	  #response = RestClient.get order_link 
        response = HTTParty.get(order_link);
      	respond_to do |format|
      		format.json {render json: response.body}
    	   end
      end

    end
  end
end