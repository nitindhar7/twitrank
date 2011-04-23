# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110425230002) do

  create_table "queries", :force => true do |t|
    t.string   "text",       :limit => 140
    t.datetime "query_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",   :limit => 100
    t.integer  "latitude"
    t.integer  "longitude"
    t.integer  "status",                    :default => 0, :null => false
  end

  create_table "searches", :force => true do |t|
    t.string   "query",      :limit => 200, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "text",                 :limit => 140
    t.string   "user",                 :limit => 100
    t.integer  "retweets"
    t.datetime "tweet_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",             :limit => 50
    t.integer  "query_id",                            :default => 1, :null => false
    t.integer  "user_followers_count",                :default => 0
    t.integer  "user_friends_count",                  :default => 0
    t.integer  "user_statuses_count",                 :default => 0
    t.integer  "user_favorites_count",                :default => 0
    t.integer  "percent_keywords"
    t.integer  "distance"
    t.integer  "time_difference"
    t.integer  "relevance",                           :default => 0
    t.integer  "status",                              :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",              :limit => 50
    t.string   "last_name",               :limit => 50
    t.string   "twitter_consumer_key",    :limit => 50
    t.string   "twitter_consumer_secret", :limit => 50
    t.string   "twitter_oauth_token",     :limit => 50
    t.string   "twitter_oauth_secret",    :limit => 50
  end

end
