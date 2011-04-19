require 'twitter'
require 'csv'

desc "Use Twitter OAuth to login, search twitter and store results"
task :save_tweets => :environment do
  include Geokit::Geocoders
  
  @client = Twitter::Client.new
  puts @client.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour"
  
  @queries = Query.find(:all, :conditions => {:id => 188})
  i = 1

  @queries.each do |query|
    
    print "#{i}) "

    Twitter::Search.new.containing( query.text ).no_retweets.geocode( query.latitude, query.longitude, "1000mi" ).lang("en").per_page( 50 ).each do |tweet|
      @user = Twitter.user( tweet.from_user )
      @query_geocode = MultiGeocoder.geocode( query.location )
      @tweet_geocode = MultiGeocoder.geocode( tweet.location )
      
      tweet_length = tweet.text.split( ' ' ).length.to_f
      query_length = query.text.split( ' ' ).length.to_f
      percent_keywords = query_length / tweet_length * 100.0
      distance = @query_geocode.distance_to( @tweet_geocode )
      time_difference = ( ( tweet.created_at.to_time - query.query_date.to_time ) / 3600 )
      
      puts "#{percent_keywords} | #{@user.followers_count} | #{@user.friends_count} | #{@user.statuses_count} | #{@user.favourites_count} | #{distance} | #{time_difference}"

      new_tweet = Tweet.new( {
        :text => tweet.text,
        :user => tweet.from_user,
        :retweets => tweet.metadata.recent_retweets || 0,
        :tweet_created_at => tweet.created_at,
        :location => Twitter.user(tweet.from_user).location,
        :query_id => query.id,
        :user_followers_count => @user.followers_count,
        :user_friends_count => @user.friends_count,
        :user_favorites_count => @user.favourites_count,
        :user_statuses_count => @user.statuses_count,
        :percent_keywords => percent_keywords,
        :distance => distance,
        :time_difference => time_difference
      } )
      
      if new_tweet.save
        puts "[#{tweet.created_at}] [#{tweet.text[0..80]}] [#{tweet.from_user}]"
      end

    end

    i += 1
    puts
  end  
end

desc "load queries from csv to db"
task :load_queries => :environment do
  event_queries = []
  
  CSV.open( "#{Rails.root}/lib/event_queries_v2.csv", 'r', '\n' ) do |row|
    event_queries << row.first.split( ',' ).map do |query|
      query.strip
    end
  end
  
  event_queries.each do |query|
    puts "#{query[0]} | #{query[1]} | #{query[2]} | #{query[3]} | #{query[4]}"
    Query.create( :text => query[0], :query_date => query[1], :location => query[2], :latitude => query[3], :longitude => query[4] )
  end
end