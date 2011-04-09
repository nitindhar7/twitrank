class AddLatLongQuery < ActiveRecord::Migration
  def self.up
    add_column :queries, :latitude, :integer, :precision => 6, :scale => 2
    add_column :queries, :longitude, :integer, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :queries, :latitude
    remove_column :queries, :longitude
  end
end
