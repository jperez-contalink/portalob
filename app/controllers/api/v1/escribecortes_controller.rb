module Api
  module V1
    class EscribecortesController < ApplicationController
      
      def index
        puts "Controlador Escribir Corte"
            @user = current_usuario
            order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.EscribeCorte"
            puts order_link 
            response = HTTParty.get(order_link, headers: {"fecha_corte" => params[:fecha_corte], "caja_id" => params[:caja_id]})
            respuesta = "";
            if response.code == 200
              respuesta = "OK"
            else
              respuesta = response.body
            end
            respond_to do |format|
              format.html {render html: respuesta}
            end

      end
    end
  end
end
