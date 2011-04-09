require 'logger'

class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end
  
  def query_tweets
    @query_tweets = Tweet.find( :all, :conditions => { :query_id => params[:id] } )
    respond_to do |format|
      format.js
    end
  end

end
