require "instagram"
# client id is the number you sign up and ask for from instagram. Access token is the number you get
# after following tedius steps from the website to tie 
Instagram.configure do |config|

	config.client_id = ENV['CLIENT_ID_KEY']
	config.access_token = ENV['ACCESS_TOKEN']

end