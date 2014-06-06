class ChatsController < ApplicationController

	load_and_authorize_resource :group

end
