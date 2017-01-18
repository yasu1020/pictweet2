class CommentsController < ApplicationController

  def create
    @comment = Comment.create(user_id: current_user.id, tweet_id: comment_params[:tweet_id], text: comment_params[:text])
    binding.pry
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  private
  def comment_params
    params.permit(:text,:tweet_id)
  end

end
