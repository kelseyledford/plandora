require "instagram"
# client id is the number you sign up and ask for from instagram. Access token is the number you get
# after following tedius steps from the website to tie 
Instagram.configure do |config|

	config.client_id = ENV['IG_CLIENT_ID']	
	config.client_secret = ENV['IG_ACCESS_TOKEN']

end