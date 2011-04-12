class AddUserInfoToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :user_followers_count, :integer, :default => 0
    add_column :tweets, :user_friends_count, :integer, :default => 0
    add_column :tweets, :user_statuses_count, :integer, :default => 0
    add_column :tweets, :user_favorites_count, :integer, :default => 0
  end

  def self.down
    remove_column :tweets, :user_followers_count
    remove_column :tweets, :user_friends_count
    remove_column :tweets, :user_statuses_count
    remove_column :tweets, :user_favorites_count
  end
end
