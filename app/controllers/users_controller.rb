class UsersController < ApplicationController

	acts_as_voter

	def index
		@users = User.all
	end

end