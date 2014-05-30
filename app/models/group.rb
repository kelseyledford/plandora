class Group < ActiveRecord::Base

	validates_presence_of :name, :description

	has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :theme

end