class Contacto < ActiveRecord::Base

	validates :titulo, :correo, presence: true	
end
