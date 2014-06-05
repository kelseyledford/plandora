class Schedule < ActiveRecord::Base

	belongs_to :group
	has_many :plans
	accepts_nested_attributes_for :plans

end
