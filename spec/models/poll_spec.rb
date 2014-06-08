require 'spec_helper'

describe Poll do
	describe 'data model relationships' do
		it { should belong_to(:group) }
		it { should have_many(:poll_options).dependent(:destroy) }
		it { should have_db_column(:topic) }
		it { should have_db_column(:group_id) }
	end
	describe 'validations' do
		it { should validate_presence_of(:topic) }
	end
	describe 'nested attributes' do
		it { should accept_nested_attributes_for(:poll_options).allow_destroy(true) }
	end

end