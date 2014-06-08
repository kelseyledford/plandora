require 'spec_helper'

describe PackingItem do
	describe 'data model relationships' do
		it { should belong_to(:group) }
	end
end
