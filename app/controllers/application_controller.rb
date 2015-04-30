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
    if request.referer.include? "sign_up"
      #redirect_to new_usuario_registration_path, notice: request.referer
      redirect_to new_usuario_registration_path, notice: "No existe una empresa con este rfc." if Empresa.where(:rfc=>params["usuario"]["rfcempresa"]).count < 1 
      if Empresa.where(:rfc=>params["usuario"]["rfcempresa"]).count > 0 
        @empresa = Empresa.find_by(rfc: params["usuario"]["rfcempresa"])
        params["usuario"]["empresa_id"] = @empresa.id
      end
    end
	end 

end
