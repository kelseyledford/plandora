require 'spec_helper'

describe Theme do
  describe 'data model relationships' do
  	it { should have_many(:groups) }
  end
end
