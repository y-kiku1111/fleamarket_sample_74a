class ProductsController < ApplicationController

  def index
    @products = Product.all
    @parents = Category.where(ancestry: nil)  
  end

  def show
    @product = Product.find(1)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.permit(:name, :explanation, :category_id, :status, :bear, :days, :brand, :price, product_photos_attributes: [:photo]).merge(user_id: current_user.id)
  end
end
