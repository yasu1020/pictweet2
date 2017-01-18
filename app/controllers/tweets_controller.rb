class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(3).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    # binding.pry
  end

  private
  def tweet_params
    params.permit(:image,:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    # binding.pry
  end

end
