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

def addproducto
	puts "add pedido PagesController"
end

def registro
	puts "Registro"
	if params[:txtNombre] && params[:txtRFC] && params[:txtCorreo]
		puts "Registra al usuario: " + params[:txtNombre] + " - " + params[:txtRFC]
		Usuario.create!({:email => params[:txtCorreo], :password => params[:txtCorreo], :password_confirmation => params[:txtCorreo], :nombre => params[:txtNombre], :rfc => params[:txtRFC], :rfcempresa => params[:hdnRFC], :empresa_id => params[:hdnID], :isadmin => false})
		redirect_to success_path
	end
	
end

def facturas
end
end

