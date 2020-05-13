class ProductsController < ApplicationController

  def index
  end

  def show
    @like = Like.find(params[:id]) 
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: params[:id])
  end

  def new
    @product = Product.new
  end

end
