require 'rails_helper'

RSpec.describe Api::V1::CustomersController, :type => :controller do
	let(:user) { Usuario.find(14)}
	before { sign_in user }
	describe "GET #index" do
			before(:each) do
				get :index
			end
			
			it "returns data into response element" do
				expect(json_response[:response]).to have_key(:data)
			end
			it { should respond_with 200 }
	end
end