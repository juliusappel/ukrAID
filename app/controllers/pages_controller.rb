class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def welcome; end

  def home
    @pending_posts = Post.all
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
    @posts = Post.where(user_id: current_user.id)
    @pending_posts = Post.where(pending: true) unless current_user.role.zero?
  end
end
