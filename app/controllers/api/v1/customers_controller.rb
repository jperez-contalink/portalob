module Api
  module V1
    class CustomersController < ApplicationController
      def index
        @user = current_usuario        
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_customer?_where=vendor=%27" + @user.vendor_id + "%27&_sortBy=name"
    	  response = RestClient.get order_link 
      	
      	render json: response
      end
    end
  end
end