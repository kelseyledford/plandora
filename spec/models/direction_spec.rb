require 'spec_helper'

describe Direction do
	let (:valid_attributes) {{
		:name => 'Hotel',
		:details => 'This is where we are meeting',
		:street => '2015 Havemeyer Lane Unit B',
		:city => 'Redondo Beach',
		:state => 'CA',
		:zip => '90278' }}
	describe 'data model relationships' do
		it { should have_db_column(:name) }
		it { should have_db_column(:details) }
		it { should have_db_column(:street) }
		it { should have_db_column(:city) }
		it { should have_db_column(:state) }
		it { should have_db_column(:zip) }
		it { should have_db_column(:latitude) }
		it { should have_db_column(:longitude) }
		it { should have_db_column(:group_id) }
		it { should belong_to(:group) }
	end
	# describe 'validations' do
	# 	it { should validate_presence_of(:name) }
	# 	it { should validate_presence_of(:street) }
	# 	it { should validate_presence_of(:city) }
	# 	it { should validate_presence_of(:state) }
	# 	it { should validate_presence_of(:zip) }
	# 	it { should ensure_length_of(:street).is_at_least(5) }
	# 	it { should ensure_length_of(:state).is_equal_to(2) }
	# 	it { should ensure_length_of(:zip).is_equal_to(5) }
	# 	it { should validate_numericality_of(:street).only_integer }
	# end
	describe '#address' do
		it 'should combine street, city, state and zip into an address' do
			place = Direction.create! valid_attributes
			@combined_address = place.address
			expect(@combined_address).to eq('2015 Havemeyer Lane Unit B Redondo Beach CA 90278')
		end
	end
	describe 'geocoding' do
		it 'should change an address into latitude and longitude' do
			place = Direction.create! valid_attributes
			expect(place.latitude).to eq(33.860812)
			expect(place.longitude).to eq(-118.375605)
		end
	end
end
