	
class Api::V1::AdImagesController < ApplicationController
	def show
		#order_link = "http://csalinas-tegik:KopoTegik@ec2-54-197-143-89.compute-1.amazonaws.com:8080/openbravo/org.openbravo.service.json.jsonrest/ADImage/"+params[:id]
		@user = current_usuario
		order_link = "http://"+ @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/ADImage/"+params[:id]
		puts order_link
		response = RestClient.get order_link 
		json_response = JSON.parse response, symbolize_names: true

   	respond_to do |format|
  		format.json {render json:  json_response}
	  end
	end
end
