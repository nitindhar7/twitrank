class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def signals
    @tweet = Tweet.find_by_id( params[:id] )
    @tweet_words = @tweet.text.split( ' ' )
    @query_words = @tweet.query.text.split( ' ' )
  end

end