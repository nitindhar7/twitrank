class AddMetaTweetData < ActiveRecord::Migration
  def self.up
    add_column :tweets, :percent_keywords, :integer, :precision => 6, :scale => 2
    add_column :tweets, :distance, :integer, :precision => 6, :scale => 2
    add_column :tweets, :time_difference, :integer, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :tweets, :percent_keywords
    remove_column :tweets, :distance
    remove_column :tweets, :time_difference
  end
end
