class UsersController < ApplicationController

	def index
		@users = User.all
		@hide_features_nav = true
	end

end