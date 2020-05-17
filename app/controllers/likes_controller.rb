class LikesController < ApplicationController

  def update

    like = Like.find(params[:id])
    like.update(comment_params)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  private
  def comment_params
    params.require(:like).permit(:like).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
