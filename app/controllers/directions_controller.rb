class DirectionsController < ApplicationController

	before_action :set_group
	before_action :set_direction, :only => [:create, :show, :edit, :update]
	load_and_authorize_resource :group

	def show
	end

	def new
		@direction = Direction.new
	end

	def create
		@direction = Direction.create(direction_params.merge(group: @group))
		if @direction.save
			redirect_to group_direction_path(@group, @direction)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @direction.update_attributes(direction_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	private

	def direction_params
		params.require(:direction).permit(:name, :details, :street, :city, :state, :zip, :latitude, :longitude, :group_id)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_direction
		@direction =  @group.direction
	end

end