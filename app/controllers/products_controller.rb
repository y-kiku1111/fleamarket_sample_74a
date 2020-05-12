class ProductsController < ApplicationController

  def index
  end

  def show
    @like = Like.find(params[:id]) 
    @product = Product.find(1)
    @comments = Comment.all
    @comments = Comment.where(product_id: params[:id])
  end

  def new
    @product = Product.new
  end

end
