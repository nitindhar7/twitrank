class UpdateQueryDateColumn < ActiveRecord::Migration
  def self.up
    change_column :queries, :query_date, :datetime
  end

  def self.down
    change_column :queries, :query_date, :date
  end
end
