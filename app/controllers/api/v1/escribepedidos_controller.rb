module Api
  module V1
    class EscribepedidosController < ApplicationController
      
      #respond_to :json

      def index
        puts "Controlador Escribir Pedidos"
        # Recibir id de pedido y contruir el json para enviarlo a Openbravo en forma de cadena.
      lineas = ""
      Pedido.where(id: params[:pedido_id], activo: true).find_each do |ord|
        Pedidolinea.where(pedido_id: ord.id).find_each do |lins|
          #lins.product_id lins.cantidad lins.precio lins.tota current_usuario.rfc
          lineas = lineas + lins.product_id + "_"
          lineas = lineas + lins.cantidad.to_s + "_"
          lineas = lineas + lins.precioob.to_s + "_"
          lineas = lineas + lins.total.to_s + "*"
          end
          puts lineas
          @user = current_usuario
          order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.EscribePedidosPortal?orden_json=" + lineas + "&rfc=" + @user.rfc + "&pedidoid=" +  params[:pedido_id]
          puts order_link 
          response = RestClient.get order_link
          puts "Actualizar Pedido"
          @Pedido = Pedido.find_by_id(params[:pedido_id])
          @Pedido.activo = false
          @Pedido.abierto = false
          @Pedido.save
          respond_to do |format|
            format.xml {
                send_data(response, :filename => 'A.zip')
             }
          end
      end

      end

      def show
        respond_with Escribepedido.find(params[:id])
      end

      def create
        respond_with Escribepedido.create(params[:product])
      end

      def update
        respond_with Escribepedido.update(params[:id], params[:product])
      end

      def destroy
        respond_with Escribepedido.destroy(params[:id])
      end
    end
  end
end