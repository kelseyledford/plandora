class GroupsController < ApplicationController

	# load_and_authorize_resource :except => [:new, :create]

	def index
		@groups = Group.all
		@hide_features_nav = true
	end
	
	def show
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
		@hide_features_nav = true
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to group_path(@group)
		else
			render :new
		end
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		if @group.update(group_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	private

	def group_params 
		params.require(:group).permit(:name, :description, :avatar, :user_ids => [])
	end


end
