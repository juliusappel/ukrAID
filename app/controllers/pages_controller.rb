class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def welcome
  end

  def home
    case params[:location]
    when "ukraine"
      @categories = Category.where(target_group: 0) + Category.where(target_group: 1)
    when "world"
      @categories = Category.where(target_group: 0) + Category.where(target_group: 2)
    else
      @categories = Category.all
    end
    @posts = Post.all
  end

  def dashboard
    @posts = Post.where(user_id: current_user.id)
    @pending_posts = Post.where(pending: true) unless current_user.role.zero?
  end
end
