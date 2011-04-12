require 'twitter'

class SearchesController < ApplicationController
  
  def index
    redirect_to(root_url) && return if params[:query].blank?
    
    Search.create(:query => params[:query])
    
    Twitter.configure do |config|
      config.consumer_key = "VPOnFXqFJZ394HLSs4MnA"
      config.consumer_secret = "VOHk80F7NvipnRaJSWiRYIROgbLjmCpzqUpnADDDfBY"
      config.oauth_token = "94414262-Hg4KmGot4IILiPGOKkzEt2R5T16WFM927Ev6uPIiR"
      config.oauth_token_secret = "RwlgjIK0VODW7pF0hCTbeUB5wdd7PmEFXm5jbmOTA"
    end
    
    @query_tweets = []
    @client = Twitter::Client.new
    Twitter::Search.new.containing( params[:query] ).no_retweets.lang("en").per_page( 5 ).each do |tweet|
      @query_tweets << tweet
    end
    
    respond_to do |format|
      format.js
    end
  end
end
