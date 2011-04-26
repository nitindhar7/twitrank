class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :queries, [:text, :query_date, :created_at, :updated_at, :location, :latitude, :longitude, :status]
    add_index :tweets, [:text, :users, :retweets, :tweet_created_at, :created_at, :updated_at, :location, :query_id, :user_followers_count, :user_friends_count, :user_statuses_count, :user_favorites_count, :percent_keywords, :distance, :time_difference, :relevance, :status] 
    add_index :searches, [:query, :created_at, :updated_at]
    add_index :users, [:email, :password_hash, :password_salt, :created_at, :updated_at, :first_name, :last_name, :twitter_consumer_key, :twitter_consumer_secret, :twitter_oauth_token, :twitter_oauth_secret]
  end

  def self.down
    remove_index :queries, [:text, :query_date, :created_at, :updated_at, :location, :latitude, :longitude, :status]
    remove_index :tweets, [:text, :users, :retweets, :tweet_created_at, :created_at, :updated_at, :location, :query_id, :user_followers_count, :user_friends_count, :user_statuses_count, :user_favorites_count, :percent_keywords, :distance, :time_difference, :relevance, :status] 
    remove_index :searches, [:query, :created_at, :updated_at]
    remove_index :users, [:email, :password_hash, :password_salt, :created_at, :updated_at, :first_name, :last_name, :twitter_consumer_key, :twitter_consumer_secret, :twitter_oauth_token, :twitter_oauth_secret]
  end
end
