class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :empresa
  has_many :pedidos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :presence => true, :email => true

  private
    def set_usuario
      @usuario = Usuario.find(params[:rfcempresa, :id])
    end  

end
