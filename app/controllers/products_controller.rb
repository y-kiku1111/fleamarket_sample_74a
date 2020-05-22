class ProductsController < ApplicationController

  def index
    @products = Product.all.includes(:product_photos).order(created_at: :desc)
    @parents = Category.where(ancestry: nil)  
  end

  def show
    @parents = Category.where(ancestry: nil)
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: params[:id])
    @user = User.find(@product.exhibitor_user_id)
    @category = Category.find(@product.category_id)
  end

  def new
    @product = Product.new
    @product.product_photos.build
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.unshift("---")

      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

    @category_parent_array = Category.where(ancestry: nil)
    @grandchildren_category = @product.category
    @children_category = @grandchildren_category.parent

    @category_children_array = Category.where(ancestry: @children_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: @grandchildren_category.ancestry)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      @category_parent_array = Category.where(ancestry: nil)
      @grandchildren_category = @product.category
      @children_category = @grandchildren_category.parent

      @category_children_array = Category.where(ancestry: @children_category.ancestry)
      @category_grandchildren_array = Category.where(ancestry: @grandchildren_category.ancestry)
      
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.exhibitor_user_id && @product.destroy
      redirect_to root_path
    else
      @parents = Category.where(ancestry: nil)  
      @comments = Comment.where(product_id: params[:id])
  
      render :show
    end

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_edit_category_children
    @edit_category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit( :name, :explanation, :category_id, :status, :bear, :brand, :days, :price, product_photos_attributes: [:photo, :_destroy, :id]).merge(exhibitor_user_id: current_user.id)
  end

end