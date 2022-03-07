class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[home welcome]

  def welcome; end

  def home
    @published_posts = Post.all
    # @published_posts = Post.where(pending: false)
    case params[:location]
    when "ukraine"
      @categories = Category.where(target_group: 0) + Category.where(target_group: 1)
      @posts = []
      @published_posts.each { |p| @posts.push(p) if p.categories.any? { |c| c.target_group <= 1 } }
    when "world"
      @categories = Category.where(target_group: 0) + Category.where(target_group: 2)
      @posts = []
      @published_posts.each { |p| @posts.push(p) if p.categories.any? { |c| c.target_group != 1 } }
    else
      @categories = Category.all
      @posts = @published_posts
    end
  end

  def dashboard
    @my_posts = Post.where(user_id: current_user.id)
    @my_pending_posts = Post.where(user_id: current_user.id, pending: true)
    @my_published_posts = Post.where(user_id: current_user.id, pending: false)
    @pending_posts = Post.where(pending: true) unless current_user.role.zero?
    @saved_posts = current_user.all_favorited
  end
end
