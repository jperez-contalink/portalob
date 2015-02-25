module Api
  module V1
    class DescargaImagenesController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.DescargaImagenesPortal?productoids=#{params[:productoids]}"
        #Configuración para servidor de dnk
        #order_link = "http://dnkprueba:dnkprueba@107.21.218.104/openbravo/ws/com.tegik.dnkprod.module.DescargaImagenesPortal?productoids=#{params[:productoids]}"
        response = RestClient.get order_link
        respond_to do |format|
          format.xml {
              #render xml: response
              send_data(response, :filename => 'tusarchivos.zip')
            }
    	  end

      end

      def show
        respond_with DescargaImagenesController.find(params[:id])
      end

      def create
        respond_with DescargaImagenesController.create(params[:product])
      end

      def update
        respond_with DescargaImagenesController.update(params[:id], params[:product])
      end

      def destroy
        respond_with DescargaImagenesController.destroy(params[:id])
      end
    end
  end
end