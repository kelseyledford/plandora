require 'spec_helper'

describe Poll do
	describe 'data model relationships' do
		it { should belong_to(:group) }
		it { should have_db_column(:topic) }
		it { should have_db_column(:option1) }
		it { should have_db_column(:option2) }
		it { should have_db_column(:option3) }
		it { should have_db_column(:option4) }
		it { should have_db_column(:option5) }
	end
end
