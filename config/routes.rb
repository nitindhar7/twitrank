ActionController::Routing::Routes.draw do |map|
  map.resources :queries, :member => { :query_tweets => :post }
  map.resources :tweets, :member => { :signals => :put }
  
  map.root :controller => :queries
end