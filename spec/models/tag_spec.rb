require 'spec_helper'

describe Tag do
	describe 'data model relationships' do
		it { should have_many(:posts) }
		it { should have_db_column(:name) }
	end
end
