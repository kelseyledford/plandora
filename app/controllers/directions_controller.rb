class DirectionsController < ApplicationController

	def index
		@directions = Direction.all
	end

	def show
		@direction = Direction.find(params[:id])
	end

	def new
		@direction = Direction.new
	end

	def create
		@direction = Direction.new(direction_params)
			if @direction.save
				redirect_to directions_path
			else
				render :new
			end
	end

	def edit
		@direction = Direction.find(params[:id])
	end

	def update
		@direction = Direction.find(params[:id])
		if @direction.update(direction_params)
			redirect_to directions_path
		else
			render :edit
		end
	end

	private

	def direction_params
		params.require(:direction).permit(:name, :details, :street, :city, :state, :zip, :latitude, :longitude)
	end

end