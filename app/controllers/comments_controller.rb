class CommentsController < ApplicationController

  # before_action :set_like

  # def set_like
   
  # end


  def show
    # @comments= Comment.all
  end

  def create
    @comment = Comment.new
 
    @comment = Comment.create(comment_params)
    # binding.pry
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  private
  def comment_params
    binding.pry
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
    
  end
end
