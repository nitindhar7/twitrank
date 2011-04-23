class AddStatusToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :status, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :tweets, :status
  end
end
