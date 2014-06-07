require 'spec_helper'

describe Link do
	describe 'data model relationships' do
		it { should have_db_column(:title) }
		it { should have_db_column(:url) }
		it { should have_db_column(:group_id) }
		it { should belong_to(:group) }
	end
	let (:improper_url_attributes) {{
		:title => 'Google',
		:url => 'www.google.com'
		}}
	let (:proper_url_attributes) {{
		:title => 'Google',
		:url => 'http://www.google.com'
		}}
	describe 'smart_add_url_protocol' do
		it 'should add http:// if none exists on the entered link' do
			link = Link.create! improper_url_attributes
			expect(link.url).to eq('http://www.google.com')
		end
		it 'should not add http:// if it already exists on the entered url' do
			link = Link.create! proper_url_attributes
			expect(link.url).to eq('http://www.google.com')
		end
	end
end