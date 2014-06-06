class HomeController < ApplicationController
	# the number is my user name account and the count is the amount of pictures displayed to the page
  def index
  	@instagram = Instagram.user_recent_media("12091701", {:count => 5})
  end
end
