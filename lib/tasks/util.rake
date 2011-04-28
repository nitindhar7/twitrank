namespace :util do
  
  desc "Dump tweets to Sofia-ml format"
  task :dump_to_sofia => :environment do
    #<relevance> 1:<tweet.text.length> 2:<tweet.percent_keywords> 3:<tweet.retweets> 4:<tweet.distance> 5:<tweet.time_difference> 6:<tweet.user_friends_count> 7:<tweet.user_followers_count> 8:<tweet.user_statuses_count> 9:<tweet.user_favorites_count>

    @file = File.new("tmp/sofia_dump_#{Time.now.to_s(:db).gsub(' ', '-')}.txt", "w")
    @tweets = Tweet.find(:all, :conditions => { :status => 1 })
    
    @tweets.each do |tweet|
      stmt = "#{tweet.relevance} " +
             "1:#{tweet.text.length} " +
             "2:#{tweet.percent_keywords} " +
             "3:#{tweet.retweets} " +
             "4:#{tweet.distance} " +
             "5:#{tweet.time_difference} " +
             "6:#{tweet.user_friends_count} " +
             "7:#{tweet.user_followers_count} " +
             "8:#{tweet.user_statuses_count} " +
             "9:#{tweet.user_favorites_count}"
      puts stmt
      @file.puts( stmt )
    end
  end
  
end