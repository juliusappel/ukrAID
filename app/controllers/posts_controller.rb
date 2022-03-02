class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @markers = @post.addresses.geocoded.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        info_window: render_to_string(partial: "info_window", locals: { address: a })
      }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.vote_score = 1
    @post.pending = true

    if @post.save!
      redirect_to @post, notice: "Your post was successfully submitted. Please wait for it to be reviewed by an Admin"
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

  private

  def post_params
    params.require(:post).permit(:title, :rich_content, photos: [])
  end
end
