class Poll < ActiveRecord::Base

	belongs_to :group
	has_many :poll_options

end
