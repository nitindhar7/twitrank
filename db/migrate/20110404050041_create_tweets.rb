class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :text, :limit => 140
      t.string :user, :limit => 100
      t.string :type, :limit => 20
      t.integer :retweets
      t.datetime :tweet_created_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
