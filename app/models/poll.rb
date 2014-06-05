class Poll < ActiveRecord::Base

	belongs_to :group
	has_many :poll_options, dependent: :destroy
	accepts_nested_attributes_for :poll_options, allow_destroy: true

end