class Empresa < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "70X70>"}  
  	validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  	has_many :usuarios
end
