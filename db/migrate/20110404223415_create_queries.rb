class CreateQueries < ActiveRecord::Migration
  def self.up
    create_table :queries do |t|
      t.string :text, :limit => 140
      t.date :query_date
      t.string :location => 100
      t.timestamps
    end
  end

  def self.down
    drop_table :queries
  end
end
