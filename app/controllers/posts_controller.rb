class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy save_post]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :show

  def show
    @categories = PostCategory.where(post_id: @post.id)
    @post_categories = Category.where(id: @categories[0].category_id)
    @markers = @post.addresses.geocoded.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        info_window: render_to_string(partial: "info_window", locals: { address: a }),
        # image_url: helpers.asset_url("/images/logo_favicon.png")
      }
    end
  end

  def new
    @post = Post.new
    @address = Address.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.vote_score = 1
    @post.pending = true
    if @post.save!
      redirect_to new_post_address_path(@post), notice: "Your post was successfully submitted. Please wait for it to be reviewed by an Admin"
    else
      render :new
    end
  end

  def destroy
    @post.destroy

    if @post.destroy
      redirect_to dashboard_path, notice: "Your post was successfully deleted."
    else
      render :show
    end
  end

  def save_post
    
  end

  def toggle_save
    @post = Post.find(params[:id])
    @user = current_user
    @user.favorited?(@post) ? @user.unfavorite(@post) : @user.favorite(@post)
    if @user.favorited?(@post)
      redirect_to dashboard_path, notice: "Post was saved."
    else
      redirect_to dashboard_path, notice: "Post was unsaved."
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :rich_content, :pending, :phone_number, :email, :website, photos: [])
  end
end
