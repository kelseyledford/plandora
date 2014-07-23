class Tag < ActiveRecord::Base
	has_many :posts
	belongs_to :group
end
