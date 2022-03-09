class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[home welcome]

  def welcome; end

  def home
    @categories = Category.all
    if params[:query].present?
      @posts = Post.search_text(params[:query]).sort { |a,b| b.sorting_score <=> a.sorting_score }
    else
      @published_posts = Post.where(pending: false)
      case params[:location]
      when "ukraine"
        @categories = Category.where(target_group: 0) + Category.where(target_group: 1)
        @posts = []
        @published_posts.each { |p| @posts.push(p) if p.categories.any? { |c| c.target_group <= 1 } }
        @posts = @posts.sort { |a,b| b.sorting_score <=> a.sorting_score }
      when "world"
        @categories = Category.where(target_group: 0) + Category.where(target_group: 2)
        @posts = []
        @published_posts.each { |p| @posts.push(p) if p.categories.any? { |c| c.target_group != 1 } }
        @posts = @posts.sort { |a,b| b.sorting_score <=> a.sorting_score }
      else
        @categories = Category.all
        @posts = @published_posts.sort { |a,b| b.sorting_score <=> a.sorting_score }
      end
    end
  end

  def dashboard
    @my_posts = Post.where(user_id: current_user.id)
    @my_published_posts = Post.where(user_id: current_user.id, pending: false)
    @my_pending_posts = Post.where(user_id: current_user.id, pending: true)
    @pending_posts = Post.where(pending: true).sort { |a,b| a.created_at <=> b.created_at } unless current_user.role.zero?
    @saved_posts = current_user.all_favorited
  end
end
