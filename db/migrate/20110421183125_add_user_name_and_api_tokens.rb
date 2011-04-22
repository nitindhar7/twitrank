class AddUserNameAndApiTokens < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string, :limit => 50
    add_column :users, :last_name, :string, :limit => 50
    add_column :users, :twitter_consumer_key, :string, :limit => 50
    add_column :users, :twitter_consumer_secret, :string, :limit => 50
    add_column :users, :twitter_oauth_token, :string, :limit => 50
    add_column :users, :twitter_oauth_secret, :string, :limit => 50
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :twitter_consumer_key
    remove_column :users, :twitter_consumer_secret
    remove_column :users, :twitter_oauth_token
    remove_column :users, :twitter_oauth_secret
  end
end
