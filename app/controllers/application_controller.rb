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
      usr = params["usuario"]["email"]
      pwd = params["usuario"]["password"]
      found = false
      url = request.referer
      usr.gsub! '@', '%40'
      pwd.gsub! '@', '%40'
      # en función de la url asignar los valores de la conexión
      ip = "ec2-54-166-7-161.compute-1.amazonaws.com:8080"
      order_link = "http://csalinas-tegik:KopoTegik@" + ip + "/openbravo/ws/com.tegik.portalob.UserValidate"
      response = HTTParty.get(order_link, headers: {"Usr" => usr, "Pwd" => pwd})
      puts order_link
      puts "CODIGO: ", response.code
      puts "MESSAGE: ", response.message
      puts "headers.inspect: ", response.headers.inspect
      puts "BODY: ", response.body
      usr.gsub! '%40', '@'
      pwd.gsub! '%40', '@'
      if response.code == 200
        puts "El usuario y contraseña son correctos en Openbravo"
        # El usuario existe en devise
        Usuario.where(email: usr).find_each do |user|
          found = true;
          puts "El usuario existe en devise actualizar la contraseña a la de openbravo"
          user.password = pwd;
          user.save;
        end
        if found == false
          puts "El usuario no existe en devise - Crearlo"
        # El usuario no existe en devise
          # Se registra el usuario en devise
          Usuario.create!({:email => usr, :password => pwd, :password_confirmation => pwd, :nombre => usr, :rfc => "rfc", :rfcempresa => "rfcempresa", :empresa_id => "2", :isadmin => false, :role => "Cliente", :partner_id => "A1315DE706FF4D36ADA80829F26C2A85"})
        end
      else
        # En ambos casos el usuario tiene que validar sus datos de acceso
        puts "El usuario o la contraseña no son correctos"
        if response.body.include? 'NOTFOUNDUSER'
          puts "El usuario no fue encontrado en la base de datos de OB"
        end
        if response.body.include? 'INCORRECTPWD'
          puts "La contraseña no es correcta o no coincide con la de OB"
        end
      end
    end #termina if signin
	end 

end
