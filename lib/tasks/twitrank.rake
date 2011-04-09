require 'twitter'
require 'csv'

desc "read csv file, search twitter and store results"
task :save_tweets => :environment do
  
  @search = Twitter::Search.new
  @queries = Query.find(:all, :conditions => "id > 163")
  
  i = 1

  @queries.each do |query|
    
    print "#{i}) "
    
    #@search.containing( query.text ).since( query[1].tr( ' ', '-' ) ).result_type( "popular" ).per_page( 5 ).each do |tweet|
    Twitter::Search.new.containing( query.text ).no_retweets.geocode( query.latitude, query.longitude, "1000mi" ).lang("en").per_page( 5 ).each do |tweet|

      new_tweet = Tweet.new( {
        :text => tweet.text,
        :user => tweet.from_user,
        :retweets => tweet.metadata.recent_retweets || 0,
        :tweet_created_at => tweet.created_at,
        :location => Twitter.user(tweet.from_user).location,
        :query_id => query.id
      } )
      
      if new_tweet.save
        puts "[#{tweet.created_at}] [#{tweet.text[0..80]}] [#{tweet.from_user}]"
      end
    end

    i += 1
    puts
  end

end

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