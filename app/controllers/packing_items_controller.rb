class PackingItemsController < ApplicationController

	before_action :set_group
	before_action :set_packing_item, :only => [:show, :edit, :update, :destroy]
	load_and_authorize_resource :group
	
	respond_to :json, :html

	def index
		@packing_items = @group.packing_items
		respond_with @packing_items
	end

	def show
    respond_with @yogurt
  end

	def new
		@packing_item = PackingItem.new
	end

	def create
		@packing_item = @group.packing_items.new(packing_item_params)
		if @packing_item.save
			respond_to do |format|
				format.html {redirect_to group_packing_items_path(@packing_item.group)}
				format.json {render json: @packing_item, status: :created }
		end
		else
			respond_to do |format|	
				format.html { render :new }
				format.json { render json: @packing_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @packing_item.update(packing_item_params)
			respond_to do |format|
				format.html { redirect_to :back } #group_packing_items_path(@packing_item.group) }
				format.json { render nothing: true, status: :no_content }
			end
		else
			respond_to do |format|
				format.html { render 'edit' }
				format.json { render json: @packing_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@packing_item.destroy
		respond_to do |format|
			format.html { redirect_to :back }
			format.json { render json: { head: :ok } }
		end
	end

	private

	def packing_item_params
		params.require(:packing_item).permit(:name, :is_packed, :packed_by)
	end

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_packing_item
		@packing_item = PackingItem.find(params[:id])
	end

end
