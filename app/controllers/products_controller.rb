class ProductsController < ApplicationController

  # before_action :set_group

  def index
  end

  def show
    @like = Like.find(params[:id]) 
    @product = Product.find(1)
    
    @comments = Comment.all

    # product_id = params[:id]
    @comments = Comment.where(product_id: params[:id])
    # @comments = Comment.where(product_id: params[:product_id])

  end

  def new
    @product = Product.new
  end

end
