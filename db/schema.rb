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

ActiveRecord::Schema.define(:version => 20110409041747) do

  create_table "queries", :force => true do |t|
    t.string   "text",       :limit => 140
    t.datetime "query_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",   :limit => 100
    t.integer  "latitude"
    t.integer  "longitude"
  end

  create_table "tweets", :force => true do |t|
    t.string   "text",             :limit => 140
    t.string   "user",             :limit => 100
    t.integer  "retweets"
    t.datetime "tweet_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",         :limit => 50
    t.integer  "query_id",                        :default => 1, :null => false
  end

end
