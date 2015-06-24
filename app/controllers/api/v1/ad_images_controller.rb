	
class Api::V1::AdImagesController < ApplicationController
	def show
		order_link = "http://csalinas-tegik:KopoTegik@ec2-54-157-42-0.compute-1.amazonaws.com:8080/openbravo/org.openbravo.service.json.jsonrest/ADImage/"+params[:id]
    
    begin 
    	response = RestClient.get order_link 	
    	json_response = JSON.parse response, symbolize_names: true
   		
  		render json:  json_response, status: :ok
    rescue => e
    	render json:  { errors: "Time Out" },
                     status: :unprocessable_entity
    end
	end
end
#render json: user, status: :created
		#else
			#render json: { user: { errors: user.errors.messages } },
                             #status: :unprocessable_entity