class UsersController < ApplicationController

  def show
    @parents = Category.where(ancestry: nil) 
  end

  def destroy
    @parents = Category.where(ancestry: nil) 
  end

end