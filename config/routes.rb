ActionController::Routing::Routes.draw do |map|
  map.resources :queries, :member => { :query_tweets => :post }
  map.resources :tweets, :member => { :fetch => :get }
  map.resources :searches
  
  map.root :controller => :queries
end