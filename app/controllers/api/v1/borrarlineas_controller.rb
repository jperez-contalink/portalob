module Api
  module V1
    class BorrarlineasController < ApplicationController
      
      #respond_to :json

      def index
        # borrar todas las lineas pertenecientes al pedido params[:pedido_id]
        puts "BORRAR LINEAS DEL PEDIDO QUE SE ACABA DE COMPLETAR"
        Pedidolinea.where(pedido_id: params[:pedido_id]).destroy_all
        puts "Líneas borradas..."
      end

      def show
        respond_with Borrarlinea.find(params[:id])
      end

      def create
        respond_with Borrarlinea.create(params[:product])
      end

      def update
        respond_with Borrarlinea.update(params[:id], params[:product])
      end

      def destroy
        respond_with Borrarlinea.destroy(params[:id])
      end
    end
  end
end