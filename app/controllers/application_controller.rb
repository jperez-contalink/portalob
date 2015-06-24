class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception Linea original se cambio por authencity token
  protect_from_forgery
  before_action :empresa_rfc, only: [:create]

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #rescue_from CanCan::AccessDenied do |exception|
   # flash[:error] = "Access denied."
   # redirect_to unauthorized_path
  #end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :rfcempresa
   devise_parameter_sanitizer.for(:sign_up) << :nombre
   devise_parameter_sanitizer.for(:sign_up) << :empresa_id
   devise_parameter_sanitizer.for(:sign_up) << :rfc
   devise_parameter_sanitizer.for(:account_update) << :nombre
  end

  def empresa_rfc
    # Asignar al usuario la empresa en función del rfcde la empresa.
    if request.referer.include? "sign_up"
      #redirect_to new_usuario_registration_path, notice: request.referer
      redirect_to new_usuario_registration_path, notice: "No existe una empresa con este rfc." if Empresa.where(:rfc=>params["usuario"]["rfcempresa"]).count < 1 
      if Empresa.where(:rfc=>params["usuario"]["rfcempresa"]).count > 0 
        @empresa = Empresa.find_by(rfc: params["usuario"]["rfcempresa"])
        params["usuario"]["empresa_id"] = @empresa.id
      end
    end
    
    if request.referer.include? "sign_in"
      #usr = params["usuario"]["email"]
      #pwd = params["usuario"]["password"]
      #url = request.referer
      #usr.gsub! '@', '%40'
      #pwd.gsub! '@', '%40'
      #order_link = "http://" + usr + ":" + pwd + "@" + "ec2-54-147-241-223.compute-1.amazonaws.com:8080" + "/openbravo/org.openbravo.service.json.jsonrest/pob_catalogoproductos?_startRow=1&_endRow=2"
      #response = HTTParty.get('http://example.com', headers: {"User-Agent" => APPLICATION_NAME})
      #UserValidate
      #/openbravo/ws/com.tegik.portalob.EscribePedidosPortal
      #order_link = "http://csalinas-tegik:KopoTegik@ec2-54-158-147-120.compute-1.amazonaws.com:8080" + "/openbravo/ws/com.tegik.portalob.UserValidate "
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
      #usr.gsub! '%40', '@'
      #pwd.gsub! '%40', '@'
    end #termina if signin
	end 

end
