class LikesController < ApplicationController
  def create
    like = Like.new(post_id: params[:post_id], author_id: params[:post_author_id])
    flash[:error] = 'Error. Please try again' unless like.save
    redirect_to user_post_path(params[:post_author_id], params[:post_id])
  end
end
