class CommentsController < ApplicationController
  def new; end

  def create
    comment = Comment.new(post_params)
    flash[:error] = 'Error. Please try again' unless comment.save
    redirect_to user_post_path(params[:comment][:post_author_id], params[:comment][:post_id])
  end

  def destroy
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    post.comments_counter -= 1
    post.save
    redirect_to user_post_path(user_id: user.id, id: post.id), notice: 'Post deleted successfully.'
  end

  private

  def post_params
    params.require(:comment).permit(:text, :post_id).merge(
      author_id: current_user.id,
      post_id: params[:comment][:post_id]
    )
  end
end
