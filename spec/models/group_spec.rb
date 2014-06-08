require 'spec_helper'

describe Group do
  describe 'data model relationships' do
    it { should have_db_column(:name) }
    it { should have_db_column(:description) }
  	it { should have_many(:users) }
		it { should have_many(:user_groups) }
    it { should belong_to(:theme) }
    it { should have_many(:polls) }
    it { should have_one(:direction) }
    it { should have_many(:schedules) }
    it { should have_many(:links) }
    it { should have_many(:packing_items) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end