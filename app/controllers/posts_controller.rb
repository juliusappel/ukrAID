class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy save_post unsave_post upvote_post downvote_post publish_post unpublish_post delete_post]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :show

  def show
    @categories = Category.where(post_id: @post.id)
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

  def publish_post
    if current_user.role == 1 && @post.pending == true
      @post.pending = false
      @post.save
      redirect_to post_path(@post), notice: "Post was published."
    else
      redirect_to home_path
    end
  end

  def unpublish_post
    if current_user.role == 1 && @post.pending == false
      @post.pending = true
      @post.save
      redirect_to post_path(@post), notice: "Post was unpublished."
    else
      redirect_to home_path
    end
  end

  def delete_post
    if current_user.role == 1
      destroy
    else
      redirect_to post_path(@post), notice: "You don't have the permissions to perform this action."
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
    if user_signed_in?
      if current_user.role == 1
        @post = Post.find(params[:id])
      elsif @post.user_id == current_user.id
        @post = Post.find(params[:id])
      elsif @post.pending == true && current_user.role != 1
        redirect_to home_path
      end
    elsif @post.pending == false
      @post = Post.find(params[:id])
    else
      redirect_to home_path
    end
  end

  def destroy
    @post.destroy

    if @post.destroy
      redirect_to dashboard_path, notice: "This post was successfully deleted."
    else
      render :show, notice: "Error while deleting post!"
    end
  end

  def post_params
    params.require(:post).permit(:title, :rich_content, :phone_number, :email, :website, photos: [])
  end
end
