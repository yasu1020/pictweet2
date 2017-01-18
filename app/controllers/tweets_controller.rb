class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
    # binding.pry
  end

  def tweet_params
    params.permit(:name,:image,:text)
  end

end
