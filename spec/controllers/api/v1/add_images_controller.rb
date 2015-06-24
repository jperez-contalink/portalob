require 'rails_helper'

RSpec.describe Api::V1::AdImagesController, :type => :controller do
	describe "GET #show" do
		#context "when the server is down" do
			#it "renders " do
			#expect(json_response) to have_key(:errors)
			#end
			#it {should respond_with 422}
		#end
		context "when send a correct image id" do
			before(:each) do
				get :show, id: "82491148278347E7A1ECF0402A9A4078" 
			end
			
			it "returns image with attribute bindaryData" do
				expect(json_response).to have_key(:bindaryData)
			end
			it {should respond_with 200}
		end
	end
end