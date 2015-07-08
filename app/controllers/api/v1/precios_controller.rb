module Api
  module V1
    class PreciosController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listaprecios?_where=taxid=%27" + @user.rfc + "%27"
        if current_usuario.empresa.es_jci == 'Y' 
          order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listapreciosjci?_where=taxid=%27" + @user.rfc + "%27"
        else
          #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listaprecios?_where=taxid=%27" + @user.rfc + "%27"
          #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listaprecios?_where=bpartner=%27" + @user.partner_id + "%27"
          order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_listaprecios?_where=pricelist=%27" + params[:pricelist] + "%27"
        end          
        puts order_link
        response = HTTParty.get(order_link);
    	  #response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

    end
  end
end