module Api
  module V1
    class BorrarlineasController < ApplicationController
      def index
        Pedidolinea.where(pedido_id: params[:pedido_id]).destroy_all
      end
    end
  end
end