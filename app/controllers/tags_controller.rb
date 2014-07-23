class TagsController < ApplicationController
  
  before_action :set_group
  before_action :set_tag, only: [:create, :show, :edit, :update, :destroy]
  load_and_authorize_resource :group

  # GET /tags/1
  # GET /tags/1.json
  def show
    # @tag = @group.tag.find(params[:id])
    # binding.pry
    # @photos = Instagram.tag_recent_media("#{tag.name}", { :count => 8,:client_id => ENV['IG_CLIENT_ID']})
    @photos = Instagram.tag_recent_media("#{@group.tag.name}", {:count => 8}, {:access_token => '12091701.27095e3.030ac770cb8f40ee91b7a34da2e62298'})
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    # (params[:tag])
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params.merge(group: @group))
    respond_to do |format|
     if @tag.save
        # @instagrams = Instagram.tag_recent_media(@tag.name.gsub(" ",""), { :count=> 8, :client_id => ENV['IG_CLIENT_ID']})
        @instagrams = Instagram.tag_recent_media(@tag.name.gsub(" ",""), {:count=> 8}, {:access_token => '12091701.27095e3.030ac770cb8f40ee91b7a34da2e62298'})

      # @instagrams.each do |post|
      #   text = post["caption"]["text"] rescue ""
      #   Post.save_post(@tag.id, text, post["user"]["profile_picture"], post["user"]["username"])
      # end
        format.html { redirect_to group_tag_path(@group, @tag), notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
       if @tag.update_attributes(tag_params)
        format.html { redirect_to group_tag_path(@group, @tag), notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
       else
        format.html { render group_tag_edit_path(@group, @tag) }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
       end
      end
    end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = @group.tag
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :group_id)
    end

end

