class ProductsController < ApplicationController

  def index

    @products = Product.all.includes(:product_photos).order(created_at: :desc)
    @parents = Category.where(ancestry: nil)  

  end

  def show

    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: params[:id])
  end

  def new
    @product = Product.new
    @product.product_photos.build
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :status, :bear, :days, :brand, :price, product_photos_attributes: [:photo]).merge(exhibitor_user_id: current_user.id)
  end
end
