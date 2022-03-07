class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy save_post unsave_post upvote_post downvote_post]
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
    current_user.favorite(@post)
    redirect_to post_path(@post), notice: "Post was saved."
  end

  def unsave_post
    current_user.unfavorite(@post)
    redirect_to post_path(@post), notice: "Post was unsaved."
  end

  def upvote_post
    @post.undisliked_by current_user if current_user.voted_for? @post
    current_user.likes @post
    redirect_to post_path(@post), notice: "Post was upvoted."
  end

  def downvote_post
    @post.unliked_by current_user if current_user.voted_for? @post
    current_user.dislikes @post
    redirect_to post_path(@post), notice: "Post was downvoted."
  end

  private

  def find_post
    @post = Post.find(params[:id])
    if user_signed_in?
      if current_user.role == 1
        @post = Post.find(params[:id])
      elsif @post.pending == true && current_user.role != 1
        redirect_to home_path
      else
        @post = Post.where(id: params[:id], pending: false)
      end
    elsif @post.pending == true
      redirect_to home_path
    else
      @post = Post.where(id: params[:id], pending: false)
    end
  end

  def post_params
    params.require(:post).permit(:title, :rich_content, :phone_number, :email, :website, photos: [])
  end
end
