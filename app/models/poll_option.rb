class PollOption < ActiveRecord::Base

	acts_as_votable

	belongs_to :poll

	validates_presence_of :option

end
