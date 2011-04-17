class QueriesController < ApplicationController
  def index
    @queries = Query.all(:order => "created_at DESC")
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

end
