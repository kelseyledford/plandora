class PollsController < ApplicationController

	before_action :set_group, :only => [:index, :create, :new]
	before_action :set_poll, :only => [:show, :edit, :update]

	def index
		@polls = @group.polls
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = @group.polls.new(poll_params)
		if @poll.save
			redirect_to group_polls_path(@group)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @poll.update(poll_params)
			redirect_to group_polls_path(@poll.group)
		else
			render :edit
		end
	end

	private

	def poll_params
		params.require(:poll).permit(:topic)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_poll
		@poll = Poll.find(params[:id])
	end

end
