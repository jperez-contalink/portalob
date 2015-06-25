module Api
  module V1
    class EscribepedidosController < ApplicationController
      
      def index
        puts "Controlador Escribir Pedidos"
        # Recibir id de pedido y contruir el json para enviarlo a Openbravo en forma de cadena.
        lineas = ""
        Pedido.where(id: params[:pedido_id], activo: true).find_each do |ord|
          puts "Iteración Pedido"
          Pedidolinea.where(pedido_id: ord.id).find_each do |lins|
            puts "Iteración Pedidolinea"
            #lins.product_id lins.cantidad lins.precio lins.tota current_usuario.rfc
            lineas = lineas + lins.product_id + "_"
            lineas = lineas + lins.cantidad.to_s + "_"
            #lineas = lineas + lins.precioob.to_s + "_"
            #lineas = lineas + lins.total.to_s + "*"
            precio = lins.precioob - lins.impuesto
            total = precio*lins.cantidad
            lineas = lineas + precio.to_s + "_"
            lineas = lineas + total.to_s + "*"          
            end
            puts lineas
            @user = current_usuario
            #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.EscribePedidosPortal?orden_json=" + lineas + "&bpuid=" + @user.partner_id + "&pedidoid=" +  params[:pedido_id]
            order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.EscribePedidosPortal"
            puts order_link 
            #response = RestClient.get order_link
            response = HTTParty.get(order_link, headers: {"Lines" => lineas, "Partner" => @user.partner_id, "Order" => params[:pedido_id]})
            #puts "CODIGO: ", response.code
            #puts "MESSAGE: ", response.message
            #puts "headers.inspect: ", response.headers.inspect
            #puts "BODY: ", response.body
            respuesta = "";
            if response.code == 200
              puts "Actualizar Pedido"
              @Pedido = Pedido.find_by_id(params[:pedido_id])
              @Pedido.activo = false
              @Pedido.abierto = false
              @Pedido.save
              respuesta = "OK"
            else
              respuesta = response.body
            end
            #respond_to do |format|
            #  format.json {
            #      send_data(response, :filename => 'A.zip')
            #   }
            #end
            respond_to do |format|
              format.html {render html: respuesta}
            end
        end
      end
    end
  end
end
#response = HTTParty.get(order_link, headers: {"Usr" => usr, "Pwd" => pwd})
#puts order_link
#puts "CODIGO: ", response.code
#puts "MESSAGE: ", response.message
#puts "headers.inspect: ", response.headers.inspect
#puts "BODY: ", response.body
#if response.code == 200
  #puts "El usuario existe en openbravo"
#  # Existe el usuario en Devise?
#  if usuario_signed_in?
#    puts "El usuario esta logeado"
#  else
#    puts "El usuario no esta logeado"
#  end
#else
#  puts "El usuario no existe en openbravo"
#end