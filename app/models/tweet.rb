class Tweet < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :query
  
  # VALIDATIONS
  validates_presence_of :text, :user, :retweets, :tweet_created_at, :query_id, :user_followers_count, :user_friends_count
  validates_presence_of :user_statuses_count, :user_favorites_count, :percent_keywords, :distance, :time_difference, :relevance, :status
  validates_length_of :text, :in => 1..140
  validates_length_of :user, :in => 1..100
  
  def self.per_page
    50
  end
end