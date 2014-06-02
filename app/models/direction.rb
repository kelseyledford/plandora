class Direction < ActiveRecord::Base

  # Combines the four parts of the address that a user submits into one string for Geocoder to change into coordinates
  def address
    self.street + " " + self.city + " " + self.state + " " + self.zip
  end 

	geocoded_by :address
  after_validation :geocode

  validates_presence_of :name, :street, :city, :state, :zip
  validates_length_of :street, minimum: 5, message: "Please enter a valid street address"
  validates_length_of :state, is: 2, message: "Please enter a valid state"
  validates :zip, length: { is: 5, message: "Zipcode is too short" }, numericality: { only_integer: true, message: "Please enter a valid zip code" }
  
  belongs_to :group

end
