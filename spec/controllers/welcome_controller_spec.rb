require 'spec_helper'

describe WelcomeController do
	describe 'GET index' do
		before do
			get :index
		end
		it 'has a 200 status code' do
			expect(response.status).to eq(200)
		end
		it 'should render the index template' do
			expect(response).to render_template :index
		end
	end
end