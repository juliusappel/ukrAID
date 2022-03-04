class PostCategoriesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @categories = Category.all
    @post_category = PostCategory.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_category = PostCategory.new(post_category_params)
    @post_category.post_id = @post.id

    # Save multiple categories to a post
    if @post_category.save
      redirect_to new_post_post_category_path(@post)
    else
      render :new
    end
  end

  private

  def post_category_params
    params.require(:post_category).permit(:category_id)
  end
end
