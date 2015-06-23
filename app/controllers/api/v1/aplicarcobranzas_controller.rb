module Api
  module V1
    class AplicarcobranzasController < ApplicationController
      
      def index
        puts "Controlador aplicar Cobranza"
        puts params[:lineas]
        puts params[:metodos]
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.AplicaCobranzaPortal?docs=" + params[:lineas] + "&rfc=" + @user.rfc
        order_link = "http://" + @user.empresa.usuariosob + ":" + 
          @user.empresa.passob + "@" + @user.empresa.urlwebservice + 
          "/openbravo/ws/com.tegik.portalob.AplicaCobranzaPortal?docs=" + 
          params[:lineas] + "&mets=" + params[:metodos] + "&bpuid=" + 
          @user.partner_id
        puts order_link 
        response = RestClient.get order_link
        respond_to do |format|
          format.xml {
              #send_data(response, :filename => 'A.zip')
              puts "XML"
           }
        end
      end
    end
  end
end