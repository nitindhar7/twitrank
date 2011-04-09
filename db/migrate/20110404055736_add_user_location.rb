class AddUserLocation < ActiveRecord::Migration
  def self.up
    add_column :tweets, :location, :string, :limit => 50
  end

  def self.down
    remove_column :tweets, :location
  end
end
