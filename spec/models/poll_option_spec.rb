require 'spec_helper'

describe PollOption do
	describe 'data model relationships' do
		it { should belong_to(:poll) }
		it { should have_db_column(:poll_id) }
		it { should have_db_column(:option) }
	end
	describe 'validations' do
		it { should validate_presence_of(:option) }
	end
end
