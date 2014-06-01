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
	end
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
