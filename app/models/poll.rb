class Poll < ActiveRecord::Base

	belongs_to :group
	has_many :poll_options
	accepts_nested_attributes_for :poll_options

end
