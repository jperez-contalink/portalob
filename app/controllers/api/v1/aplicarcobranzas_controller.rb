module Api
  module V1
    class AplicarcobranzasController < ApplicationController
      
      #respond_to :json

      def index
        puts "Controlador aplicar Cobranza"
        puts params[:lineas]
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.AplicaCobranzaPortal?docs=" + params[:lineas] + "&rfc=" + @user.rfc
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.AplicaCobranzaPortal?docs=" + params[:lineas] + "&bpuid=" + @user.partner_id
        puts order_link 
        response = RestClient.get order_link
        respond_to do |format|
          format.xml {
              send_data(response, :filename => 'A.zip')
           }
        end
      end

      def show
        respond_with Aplicacobranza.find(params[:id])
      end

      def create
        respond_with Aplicacobranza.create(params[:product])
      end

      def update
        respond_with Aplicacobranza.update(params[:id], params[:product])
      end

      def destroy
        respond_with Aplicacobranza.destroy(params[:id])
      end
    end
  end
end