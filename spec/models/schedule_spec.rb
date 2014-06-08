require 'spec_helper'

describe Schedule do
	describe 'data model relationships' do
		it { should belong_to (:group) }
		it { should have_many(:plans).dependent(:destroy) }
		it { should have_db_column(:date) }
		it { should have_db_column(:group_id) }
	end
	describe 'nested attributes' do
		it { should accept_nested_attributes_for(:plans).allow_destroy(true) }
	end
end