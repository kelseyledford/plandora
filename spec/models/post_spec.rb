require 'spec_helper'

describe Post do
  describe 'data model relationships' do
  	it { should belong_to(:tag) }
		it { should have_db_column(:description) }
		it { should have_db_column(:profile_image_url) }
		it { should have_db_column(:user_name) }
		it { should have_db_column(:tag_id) }
  end
end
