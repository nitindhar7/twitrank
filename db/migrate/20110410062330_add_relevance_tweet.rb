class AddRelevanceTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :relevance, :integer, :default => 0
  end

  def self.down
    remove_column :tweets, :relevance
  end
end
