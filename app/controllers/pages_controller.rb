class PagesController < ApplicationController
def home
        if current_usuario
            redirect_to estadosdecuenta_path
        else
        	redirect_to new_usuario_session_path
        end
end

  def facturas
  end
end
