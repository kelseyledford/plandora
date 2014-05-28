require 'spec_helper'

describe User do
  describe 'data model relationships' do
  	it { should have_many(:groups) }
		it { should have_many(:user_groups) }
  end
end