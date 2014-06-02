require 'spec_helper'

describe Group do
  describe 'data model relationships' do
  	it { should have_many(:users) }
		it { should have_many(:user_groups) }
    it { should have_one(:direction) }
		it { should have_db_column(:name) }
		it { should have_db_column(:description) }
    it { should belong_to(:theme) }
  end
  describe 'validations' do
  	before do
  		@group = Group.new
  	end
  	it 'should have a name' do
  		expect(@group).to be_invalid
  	end
  	it 'should have a description' do
  		@group.name = "Camping Trip"
  		expect(@group).to be_invalid
  	end
  end
end