ActionController::Routing::Routes.draw do |map|
  map.resources :queries, :member => { :query_tweets => :post }
  map.resources :tweets, :member => { :fetch => :get }
  map.resources :searches, :collection => { :autocomplete => :get }
  map.resources :users, :member => { :welcome => :get }, :path_names => { :new => "sign_up" }
  map.resources :sessions, :path_names => { :new => "log_in" }
  
  map.log_out "sessions/log_out", :controller => :sessions, :action => :show
  
  map.root :controller => :users, :action => :welcome
end