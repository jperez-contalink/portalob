module Api
  module V1
    class PedidonuevosController < ApplicationController
      def index
        #Aca debo obtener el ultimo pedio abierto del usuario, cerrarlo y asignar las lineas a un nuevo pedido.
        Pedido.where(usuario_id: params[:usuario_id]).find_each do |ords|
          if ords.activo?
            @ord = ords
          end
        end
        # Si no se encontró una orden crear  una y asignarla a @ord:
        if @ord.nil?
          puts "No se ha encontrado un pedido abierto [api/v1/pedidonuevos_controller]"
        else
          # cerrar la orden vieja
          @ord.activo = false
          @ord.abierto = false
          @ord.save
          puts "Se cerró la orden vieja"
          # crear orden nueva
          @new = Pedido.create!({:usuario_id => params[:usuario_id], :total => 0, :subtotal => 0, :abierto => true, :activo => true})
          puts "Crear una nueva orden"
          # asignar todas las lineas de la orden vieja a la orden nueva
          Pedidolinea.where(pedido_id: @ord.id).find_each do |lins|
            @lin = lins
            @lin.pedido_id = @new.id
            @lin.save
          end
          puts "Se asignaron las lineas a una nueva orden"
          # Crear la linea en el pedido activo
          #puts "CREAR LINEA"
          # El precio ya incluye impuesto por es no se considera.
          #total = params[:cantidad].to_f*params[:precio].to_f
          # params[:impuesto]
          #Pedidolinea.create!({:pedido_id => @ord.id, :producto => params[:producto], :product_value => params[:product_value], :precio => params[:precio], :total => total, :cantidad => params[:cantidad], :product_id => params[:producto_id], :imagen => params[:imagenurl], :maximo => params[:invmax].to_f})
          #Pedidolinea.create!({:pedido_id => @ord.id, :producto => params[:producto], :product_value => params[:product_value], :precio => params[:precio], :total => total, :cantidad => params[:cantidad], :product_id => params[:producto_id], :imagen => params[:imagenurl], :maximo => params[:invmax].to_f, :impuesto => params[:impuesto].to_f, :precioob => params[:precioob].to_f, :precioproductoextra => params[:precioproductoextra].to_f, :productoextra => params[:productoextra], :impuestoextra => params[:impuestoproductoextra]})
          @pedidolineas = Pedidolinea.all
          head :no_content
        end
      end
    end
  end
end