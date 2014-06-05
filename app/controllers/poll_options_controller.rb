class PollOptionsController < ApplicationController

	before_action :set_poll, :only => [:index, :create, :new]
	before_action :set_poll_option, :only => [:show, :edit, :update, :upvote]

	def index
		@poll_options = @poll.poll_options
	end

	def new
		@poll_option= PollOption.new
	end

	def create
		@poll_option= @poll.poll_options.new(poll_option_params)
		if @poll_option.save
			redirect_to group_polls_path(@poll.group)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @poll_option.update(poll_option_params)
			redirect_to poll_path(@poll_option.poll)
		else
			render :edit
		end
	end

	def destroy
		@poll.destroy
		redirect_to group_polls_path(@poll.group)
	end

	def upvote
	  @poll_option.liked_by current_user
	  redirect_to :back
	end

	private

	def poll_option_params
		params.require(:poll_option).permit(:option)
	end

	def set_poll
		@poll = Poll.find(params[:poll_id])
	end

	def set_poll_option
		@poll_option= PollOption.find(params[:id])
	end

end
