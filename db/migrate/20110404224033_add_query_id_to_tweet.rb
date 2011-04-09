class AddQueryIdToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :query_id, :integer, :null => false, :default => 1
  end

  def self.down
    remove_column :tweets, :query_id
  end
end
