class QueriesController < ApplicationController
  before_filter :auth_login
  before_filter :load_queries, :only => [:index, :create]
  
  def index
    @tweets = @queries.first.tweets unless @queries.first.blank?
  end
  
  def create
    @query = Query.new({
      :text => params[:text],
      :query_date => params[:query_date],
      :location => params[:location],
      :latitude => params[:latitude],
      :longitude => params[:longitude]
    })
    @query.save
    
    respond_to do |format|
      format.js
    end
  end
  
  def query_tweets
    @query_tweets = Tweet.find( :all, :conditions => { :query_id => params[:id] } )
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def load_queries
    @queries = Query.all(:order => "query_date DESC")
  end

end
