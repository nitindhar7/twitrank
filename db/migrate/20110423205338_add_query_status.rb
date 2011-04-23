class AddQueryStatus < ActiveRecord::Migration
  def self.up
    add_column :queries, :status, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :queries, :status
  end
end
