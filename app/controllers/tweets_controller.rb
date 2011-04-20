class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def update
    @tweet = Tweet.find(params[:id])    
    @tweet.update_attributes(params[:tweet])
  end

end