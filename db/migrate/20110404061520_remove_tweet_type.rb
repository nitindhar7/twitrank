class RemoveTweetType < ActiveRecord::Migration
  def self.up
    remove_column :tweets, :type
  end

  def self.down
    add_column :tweets, :type, :string, :limit => 20
  end
end
