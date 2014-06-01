require 'spec_helper'

describe DirectionsController do
	let (:valid_attributes) {{
		:name => 'Hotel',
		:details => 'We will meet here',
		:street => '2015 Havemeyer Lane Unit B',
		:city => 'Redondo Beach',
		:state => 'CA',
		:zip => '90278',
		:latitude => 33.860812,
		:longitude => -118.375605 }}

	describe 'GET index' do
		before do
			@location1 = Direction.create! valid_attributes
			@location2 = Direction.create! valid_attributes
			get :index
		end
		it 'has a 200 status code' do
			expect(response.status).to eq(200)
		end
		it 'should show all features from assigning @directions' do
			expect(assigns(:directions)).to include(@location1)
			expect(assigns(:directions)).to include(@location2)
		end
		it 'should render the index template' do
			expect(response).to render_template :index
		end
	end

	describe 'GET show' do
		before do
			@direction = Direction.create! valid_attributes
			get :show, id: @direction.id
		end
		it 'should be successful' do
			expect(response).to be_success
		end
		it 'should show the right direction' do
			expect(assigns(:direction)).to eq(@direction)
		end
		it 'renders the #show view' do
			expect(response).to render_template :show
		end
	end

	describe 'GET new' do
		before do
			get :new
		end
		it 'should render the new template' do
			expect(response).to render_template :new
		end
		it 'should succeed' do
			expect(response).to be_success
		end
		it 'should assign new direction' do
			expect(assigns(:direction)).to be_a(Direction)
			expect(assigns(:direction)).to_not be_persisted
		end
	end

	describe 'POST create' do
		describe 'successful create' do
			it 'should save a new direction to the database' do
				expect do
					post :create, direction: valid_attributes
				end.to change(Direction, :count).by(1)
			end
			it 'should redirect to the index path' do			
				post:create, direction: valid_attributes
				expect(response).to redirect_to directions_path
			end
		end
		describe 'with invalid attributes' do
			let(:invalid_attributes) {{
				:street => '2015 Havemeyer Lane Unit B',
				:city => 'Redondo Beach',
				:state => 'CA',
				:zip => '90278' }}
			# Double check this
			it 'does not save the new direction' do
				expect do
					post :create, direction: invalid_attributes
					response.should render_template :new
				end
			end
			it 're-renders the new method' do
				post :create, direction: invalid_attributes
				response.should render_template :new
			end
		end
	end

	describe 'GET edit' do
		before do
			@direction = Direction.create! valid_attributes
			get :edit, id: @direction.id
		end
		it 'should be successful' do
			expect(response).to be_success
		end
		it 'should edit the right direction' do
			expect(assigns(:direction)).to eq(@direction)
		end
		it 'renders the edit view' do
			expect(response).to render_template :edit
		end
	end

	describe 'PUT update' do
		let(:updated_attributes) {{
			:name => 'Campground',
			:details => 'Set up camp here' }}
		describe 'valid attributes' do
			before do
				@direction = Direction.create! valid_attributes 
				put :update, id: @direction.id, direction: updated_attributes
			end
			it 'locates the requested direction' do
				expect(assigns(:direction)).to eq(@direction)
			end
			it 'changes the direction attributes' do
				@direction.reload
				expect(@direction.name).to eq('Campground')
				expect(@direction.details).to eq('Set up camp here')
			end
			it 'redirects to the index path' do
				expect(response).to redirect_to directions_path
			end
		end
		describe 'invalid attributes' do
			let :invalid_attributes do { 
			:name => nil,
			:details => 'Set up camp here' } end
			before do
				@direction = Direction.create! valid_attributes
				put :update, id: @direction.id, direction: invalid_attributes
			end
			it 'located the requested direction' do
				expect(assigns(:direction)).to eq(@direction)
			end
			it 'does not change the direction attributes' do
				@direction.reload
				expect(@direction.name).to_not eq('Campground')
			end
			it 're-renders the edit method' do
				expect(response).to render_template :edit
			end
		end
	end
end
