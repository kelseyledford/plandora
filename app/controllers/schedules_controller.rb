class SchedulesController < ApplicationController

	before_action :set_group, :only => [:index, :create, :new]
	before_action :set_schedule, :only => [:show, :edit, :update, :destroy]
	load_and_authorize_resource :group

	def index
		@schedules = @group.schedules
	end

	def show
	end

	def new
		@schedule = Schedule.new
	end

	def create
		@schedule = @group.schedules.new(schedule_params)
		if @schedule.save
			redirect_to group_schedules_path(@group)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @schedule.update_attributes(schedule_params)
			redirect_to group_schedules_path(@schedule.group)
		else
			render :edit
		end
	end

	def destroy
		@schedule.destroy
		redirect_to :back
	end

	private

	def schedule_params
		params.require(:schedule).permit(:date)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_schedule
		@schedule =  Schedule.find(params[:id])
	end

end
