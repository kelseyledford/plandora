class PackingItemsController < ApplicationController

	before_action :set_group, :only => [:index, :create, :new, :edit, :update, :destroy]
	before_action :set_packing_item, :only => [:show, :edit, :update, :destroy]

	def index
		@packing_items = @group.packing_items
	end

	def new
		@packing_item = PackingItem.new
	end

	def create
		@packing_item = @group.packing_item.new(packing_item_params)
		if @packing_item.save
			redirect_to group_packing_items_path(@packing_item.group)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @packing_item.update_attributes(packing_item_params)
			redirect_to group_packing_items_path(@packing_item.group)
		else
			render :edit
		end
	end

	def destroy
		@packing_item.destroy
		redirect_to :back
	end

	private

	def packing_item_params
		params.require(:packing_item).permit(:name, :is_packed)
	end

	def set_group
		@group = Group.find(param[:group_id])
	end

	def set_packing_item
		@packing_item = PackingItem.find(params[:id])
	end

end
