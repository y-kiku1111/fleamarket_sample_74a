class ProductsController < ApplicationController

  def index
  end

  def show
    # @product = Product.new
    # binding.pry
    # @product = Product.all
    # id = 1
    # @product = Product.find(params[:id])
    @product = Product.find(1)
    # binding.pry

  end

  def new

  end

end
