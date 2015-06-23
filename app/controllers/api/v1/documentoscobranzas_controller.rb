module Api
  module V1
    class DocumentoscobranzasController < ApplicationController
      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaFacturasPortal?_where=taxid=%27" + @user.rfc + "%27"
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_documentocobranza?_where=taxid=%27" + @user.rfc + "%27&_orderBy=dateinvoiced"
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_documentocobranza?_where=bpartner=%27" + @user.partner_id + "%27&_orderBy=dateinvoiced"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end
    end
  end
end