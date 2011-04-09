class AddLocationToQuery < ActiveRecord::Migration
  def self.up
    add_column :queries, :location, :string, :limit => 100
  end

  def self.down
    remove_column :queries, :location
  end
end
