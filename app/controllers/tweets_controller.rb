class TweetsController < ApplicationController
  before_filter :auth_login
  before_filter :twitter_config, :only => [:fetch, :requests]
  
  include Geokit::Geocoders
  
  def index
    @tweets = Tweet.all
  end
  
  def update
    @tweet = Tweet.find(params[:id])    
    @tweet.update_attributes(params[:tweet])
  end
  
  def fetch
    @query = Query.find(params[:id])
    fetch_tweets(@query)
    render :partial => "fetch"
  end
  
  def requests
    flash[:notice] = twitter_request_count
    
    respond_to do |format|
      format.js
    end
  end
  
  protected
  
  def twitter_request_count
    Twitter::Client.new.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour"
  end
  
  def fetch_tweets(query)
    Twitter::Search.new.containing( query.text ).no_retweets.geocode( query.latitude, query.longitude, "1000mi" ).lang("en").per_page( Tweet.per_page ).each do |tweet|
      @user = Twitter.user( tweet.from_user )
      @query_geocode = MultiGeocoder.geocode( query.location )
      @tweet_geocode = MultiGeocoder.geocode( tweet.location )
      
      tweet_length = tweet.text.split( ' ' ).length.to_f
      query_length = query.text.split( ' ' ).length.to_f
      percent_keywords = query_length / tweet_length * 100.0
      distance = @query_geocode.distance_to( @tweet_geocode )
      time_difference = ( ( tweet.created_at.to_time - query.query_date.to_time ) / 3600 )

      new_tweet = Tweet.new( {
        :text => tweet.text,
        :user => tweet.from_user,
        :retweets => tweet.metadata.recent_retweets || 0,
        :tweet_created_at => tweet.created_at,
        :location => Twitter.user(tweet.from_user).location,
        :query_id => query.id,
        :user_followers_count => @user.followers_count,
        :user_friends_count => @user.friends_count,
        :user_favorites_count => @user.favourites_count,
        :user_statuses_count => @user.statuses_count,
        :percent_keywords => percent_keywords,
        :distance => distance,
        :time_difference => time_difference
      } )
      
      new_tweet.save
    end
  end

end