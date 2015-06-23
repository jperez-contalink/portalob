	
class Api::V1::AdImagesController < ApplicationController
	def show
		order_link = "http://csalinas-tegik:KopoTegik@ec2-54-158-147-120.compute-1.amazonaws.com:8080/openbravo/org.openbravo.service.json.jsonrest/ADImage/F43F1BB08A504B859FC6A4ACFC9431FB"
    response = RestClient.get order_link 
    json_response = JSON.parse response, symbolize_names: true

   	respond_to do |format|
  		format.json {render json:  json_response}
	  end
	end
end
