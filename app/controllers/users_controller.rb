class UsersController < ApplicationController

  def show
    @parents = Category.where(ancestry: nil) 
  end

  def destroy
    
  end

end