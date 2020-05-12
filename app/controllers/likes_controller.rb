class LikesController < ApplicationController

  def edit
    # binding.pry

    # @like = Like.find(params[:id])
  end

  def update
    # @like = Like.find(params[:id])
    # @like = Like.update(comment_params)
    like = Like.find(params[:id])
    like.update(comment_params)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  private
  def comment_params
    # binding.pry
    params.require(:like).permit(:like).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
