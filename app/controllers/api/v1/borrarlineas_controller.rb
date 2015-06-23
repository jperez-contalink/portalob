module Api
  module V1
    class BorrarlineasController < ApplicationController
      def index
        # borrar todas las lineas pertenecientes al pedido params[:pedido_id]
        puts "BORRAR LINEAS DEL PEDIDO QUE SE ACABA DE COMPLETAR"
        Pedidolinea.where(pedido_id: params[:pedido_id]).destroy_all
        puts "Líneas borradas..."
      end
    end
  end
end