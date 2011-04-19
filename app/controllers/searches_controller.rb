require 'twitter'

class SearchesController < ApplicationController
  
  def index
    redirect_to(root_url) && return if params[:query].blank?
    
    Search.create(:query => params[:query])
    
    @query_tweets = []
    @client = Twitter::Client.new
    Twitter::Search.new.containing( params[:query] ).no_retweets.lang("en").per_page( 100 ).each do |tweet|
      @query_tweets << tweet
    end
    
    respond_to do |format|
      format.js
    end
  end
end
