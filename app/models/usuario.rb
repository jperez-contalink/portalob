class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :empresa
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
    def set_usuario
      @usuario = Usuario.find(params[:rfcempresa, :id])
    end

	def empresa_rfc
	  notice "cualquier cosa"
	  #@empresa = empresa.find_by(rfc: params[:rfcempresa])	
	  #redirect_to new_usuario_registration_path, notice: "No existe una empresa con este rfc" if @empresa.nil?
	  #redirect_to new_usuario_registration_path, notice: "No existe una empresa con este rfc" if Empresa.where(:rfc=>params[:rfcempresa]).count < 1 
	end   

end
