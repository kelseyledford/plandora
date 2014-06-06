class LinksController < ApplicationController

	before_action :set_group, :only => [:index, :edit, :update, :destroy, :new, :create]
	before_action :set_link, :only => [:show, :edit, :update, :destroy]

	def index
		@links = @group.links
	end

	def new
		@link = Link.new
	end

	def create
		@link = @group.links.new(link_params)
		if @link.save
			redirect_to group_links_path(@link.group)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @link.update_attributes(link_params)
			redirect_to group_links_path(@link.group)
		else
			render :edit
		end
	end

	def destroy
		@link.destroy
		redirect_to :back
	end

	private

	def link_params
		params.require(:link).permit(:title, :url, :group_id)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_link
		@link = Link.find(params[:id])
	end

end
