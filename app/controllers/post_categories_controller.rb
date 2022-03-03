class PostCategoriesController < ApplicationController
  def create
    @post = Post.find[params[:post_id]]
    @category = Category.find[params[:category_id]]
  end
end
