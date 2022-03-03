class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[home welcome]

  def welcome; end

  def home
    @categories = Category.all
    @posts = Post.all
  end

  def dashboard
    @posts = Post.where(user_id: current_user.id)
    @pending_posts = Post.where(pending: true) unless current_user.role.zero?
  end
end
