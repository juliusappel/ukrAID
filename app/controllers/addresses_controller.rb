class AddressesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])

    # Refactor code below with pundit !!!
    if @post.pending? && @post.user == current_user
      @address = Address.new
    else
      redirect_to post_path(@post), alert: 'The post you are trying to edit has been approved already.'
    end
  end

  def create
    @address = Address.new(address_params)
    @post = Post.find(params[:post_id])
    @address.post = @post

    if @address.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def address_params
    params.require(:address).permit(:location, :name)
  end
end
