class AddressesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @address = Address.new
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
