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
      :longitude => params[:longitude],
      :status => params[:status]
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
  
  def finish
    @query = Query.find( params[:id] )
    @query.status = 1
    @query.save
    Tweet.update_all( "status = 1", "query_id = #{@query.id}" )
    flash[:notice] = "Query Finished"
    render :partial => "finish"
  end
  
  def destroy
    Query.delete( params[:id] )
    flash[:notice] = "Query Deleted"
    render :nothing => true
  end
  
  private
  
  def load_queries
    @queries = Query.all(:order => "query_date DESC")
  end

end
