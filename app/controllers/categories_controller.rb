class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.where(pending: false)
  end

  def all
    @both_categories = Category.where(target_group: 0)
    @ua_categories = Category.where(target_group: 1)
    @world_categories = Category.where(target_group: 2)
  end
end
