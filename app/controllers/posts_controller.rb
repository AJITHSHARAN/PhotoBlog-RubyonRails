class PostsController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @post= Post.all
  end
  def admin
  end 
  def new
  end    
  def home
  end
  # GET /photos
  # GET /photos.json
  # POST /photos
  # POST /photos.json
  def create
    @post = Post.new(photo_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'photos was successfully created.' }
        
        #rerect_to show_url(@photo.id)
       #format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
def edit
  end
  def show
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    
    respond_to do |format|
      if @post.update(photo_params)
        format.html { redirect_to post_path(@post), notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @post = Post.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.permit(:title,:image_url,:aperture,:iso,:shutterspeed)
    end
end