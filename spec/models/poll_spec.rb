require 'spec_helper'

describe Poll do
	describe 'data model relationships' do
		it { should belong_to(:group) }
		it { should have_db_column(:topic) }
	end
end
