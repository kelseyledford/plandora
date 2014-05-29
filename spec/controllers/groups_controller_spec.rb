require 'spec_helper'

describe GroupsController do
	let(:valid_attributes) {{
		:name => 'Vegas',
		:description => 'turn up'}}
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
		it 'should assign new group' do
			expect(assigns(:group)).to be_a(Group)
			expect(assigns(:group)).to_not be_persisted
		end
	end

	describe 'POST create' do
		describe 'successful create' do
			it 'should save a new Group to the database' do
				expect do
					post :create, group: valid_attributes
				end.to change(Group, :count).by(1)
			end
			it 'should redirect to the index path' do
				post:create, group: valid_attributes
				expect(response).to redirect_to groups_path
			end
		end
		describe 'with invalid attributes' do
			let(:invalid_attributes) {{
				:name => 'Vegas'}}
			it 'does not save the new group' do
				expect do
					post :create, group: invalid_attributes
					response.should render_template :new
				end
			end
			it 're-renders the new method' do
				post :create, group: invalid_attributes
				response.should render_template :new
			end
		end
	end

	# describe "PUT update" do
	# 	before do
	# 		@group = Group.create! valid_attributes
	# 		put :update, id: @group.id
	# 	end
	# 	describe "valid attributes" do
	# 		it "located the requested @group" do 
	# 			expect(assigns(:group)).to eq(@group)
	# 		end
	# 	end
	# end
end