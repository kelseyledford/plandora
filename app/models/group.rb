class Group < ActiveRecord::Base

	validates_presence_of :name, :description

	has_attached_file :avatar, 
		:styles => { 
			:medium => "300x300>", 
			:thumb => "100x100>" },
		  :storage => :s3,
  		:s3_credentials => {
        access_key_id: ENV['ACCESS_KEY_ID'],
        secret_access_key: ENV['SECRET_ACCESS_KEY'],
        bucket: 'Plandora'
      },
  		:path => ":attachment/:id/:style.:extension",
  		:bucket => "Plandora",
			:default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :theme
  has_one :direction
  has_many :polls
  has_many :schedules
  has_many :links
  has_many :packing_items
  has_one :tag
end