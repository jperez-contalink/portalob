class PagesController < ApplicationController
def home
        if current_usuario
            redirect_to estadosdecuenta_path
        else
        	redirect_to new_usuario_session_path
        end
end

#def test
#	puts "TEST"
#	if params[:txtNombre] && params[:txtRFC] && params[:txtCorreo]
#		puts "Registra al usuario: " + params[:txtNombre] + " - " + params[:txtRFC]
		#redirect_to test_path		
		#User.new({:email => "guy@gmail.com", :roles => ["admin"], :password => "111111", :password_confirmation => "111111" }).save(false)
		#Usuario.create!({:email => "guy@gmail2.com", :password => "KopoTegik", :password_confirmation => "KopoTegik", :nombre => "Usuario Prueba2", :rfc => "ASJ9810288T9", :rfcempresa => "HB1990", :empresa_id => 1, :isadmin => false})
#		Usuario.create!({:email => params[:txtCorreo], :password => params[:txtCorreo], :password_confirmation => params[:txtCorreo], :nombre => params[:txtNombre], :rfc => params[:txtRFC], :rfcempresa => params[:hdnRFC], :empresa_id => params[:hdnID], :isadmin => false})
#		redirect_to test_path
#	end
	#@post = Post.new
	#render text: params[@post].inspect
	#puts params[:name]
	#redirect_to estadosdecuenta_path
#end

def carrito
	puts "CARRITO CTRL"
	if params[:hdn_sbmt]
		puts "SBMT: " + params[:hdn_sbmt] + " SAVE: " + params[:hdn_save]
		if params[:hdn_save] == "Y"	
			puts "GUARDAR CAMBIOS"
			puts "QUE MANDO A BORRAR: " + params[:productos_drop]
			ids = params[:productos_drop].split("_").map(&:to_i)
			ids.each do |linea|
  				puts "Borrar linea con id: #{linea}"
  				Pedidolinea.find(linea).destroy
			end
			puts "QUE MANDO A CAMBIAR: " + params[:productos_change]
			ids = params[:productos_change].split(",")
			ids.each do |linea|
				props = linea.split("_")
				@Change = Pedidolinea.find_by_id(props.at(0))
				@Change.cantidad = props.at(1)
				@Change.total = @Change.cantidad*@Change.precio
				@Change.save
			end
			action = "S"
		else
			#ESTO DESAPARECERA YA TODO SE HACE EN VIVO
			puts "QUE MANDO A BORRAR: " + params[:productos_drop]
			ids = params[:productos_drop].split("_").map(&:to_i)
			ids.each do |linea|
  				puts "Borrar linea con id: #{linea}"
  				#Pedidolinea.find(linea).destroy
			end
			puts "QUE MANDO A CAMBIAR: " + params[:productos_change]
			ids = params[:productos_change].split(",")
			ids.each do |linea|
				props = linea.split("_")
				@Change = Pedidolinea.find_by_id(props.at(0))
				@Change.cantidad = props.at(1)
				@Change.total = @Change.cantidad*@Change.precio
				#@Change.save
			end
			puts "COLOCAR PEDIDO"
			@Pedido = Pedido.find_by_id(params[:hdn_pedido_id])
			@Pedido.activo = false
			@Pedido.abierto = false
			@Pedido.save			
			action = "P"
			#Rest Service que escribe el pedido.o
        	
		end		
		#redirect_to success_order_path
		redirect_to success_order_path({:pedido_id => params[:hdn_pedido_id]})
	end
end

def cambia_linea
	puts "ENTRA A BORRAR PRODUCTO L: " + params[:linea_id] + " + V: " + params[:valor]
	@Change = Pedidolinea.find_by_id(params[:linea_id]);
	@Change.cantidad = params[:valor]
	@Change.total = @Change.cantidad*@Change.precio
	@Change.save
end
def borrar_linea
	Pedidolinea.find(params[:linea_id]).destroy
end

def registro
	puts "Registro"
	if params[:txtNombre] && params[:txtRFC] && params[:txtCorreo]
		puts "Registra al usuario: " + params[:txtNombre] + " - " + params[:txtRFC]
		Usuario.create!({:email => params[:txtCorreo], :password => params[:txtCorreo], :password_confirmation => params[:txtCorreo], :nombre => params[:txtNombre], :rfc => params[:txtRFC], :rfcempresa => params[:hdnRFC], :empresa_id => params[:hdnID], :isadmin => false})
		redirect_to success_path
	end
end

def success_order
	puts "ENTRA A SUCCESS ORDER" + current_usuario.email
	@user = current_usuario
	#order_link = "http://csalinas-tegik:KopoTegik@23.23.245.49/openbravo/ws/com.tegik.portalob.DescargaDocumentosPortal?facturaids=893B8B30D84743E69B23D574F59A81DA_"

end	

def facturas
end
end

