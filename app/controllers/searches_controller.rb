require 'twitter'

class SearchesController < ApplicationController
  
  def index
    redirect_to(root_url) && return if params[:query].blank?
    
    Search.create(:query => params[:query])
    
    @query_tweets = []
    @client = Twitter::Client.new
    Twitter::Search.new.containing( params[:query] ).no_retweets.lang("en").per_page( 5 ).each do |tweet|
      @query_tweets << tweet
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  def autocomplete
    @ac_results = []
    
    Search.find(:all, :select => 'DISTINCT query', :conditions => "query LIKE '%#{params[:q]}%'").each do |s|
      @ac_results << s.query
    end
    Query.find(:all, :select => 'DISTINCT text', :conditions => "text LIKE '%#{params[:q]}%'").each do |q|
      @ac_results << q.text
    end
    
    @ac_results
  end
end
