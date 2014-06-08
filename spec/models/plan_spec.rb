require 'spec_helper'

describe Plan do
	describe 'data model relationships' do
		it { should belong_to(:schedule) }
		it { should have_db_column(:activity) }
		it { should have_db_column(:schedule_id) }
		it { should have_db_column(:activity_time) }
	end
	describe 'default scope' do
  	let!(:plan_one) { Plan.create(activity_time: '2000-01-01 10:00:00 UTC' ) }
  	let!(:plan_two) { Plan.create(activity_time: '2000-01-01 01:00:00 UTC' ) }
  	it 'orders by ascending activity_time' do
    	Plan.all.should eq [plan_two, plan_one]
  	end
	end
end