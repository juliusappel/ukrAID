class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def welcome
  end

  def home
    @categories = Category.all
    if params[:query].present?
      sql_query = "post.title @@ :query"
      @posts = Post.all
    else
      @posts = Post.all
    end
  end

  def dashboard
    @posts = Post.where(user_id: current_user.id)
    @pending_posts = Post.where(pending: true) unless current_user.role.zero?
  end
end
