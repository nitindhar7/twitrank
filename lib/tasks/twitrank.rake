require 'twitter'
require 'csv'

desc "read csv file, search twitter and store results"
task :search_and_save_twitter => :environment do
  
  event_queries = []
  
  # keywords, date (yyyy-mm-dd), location
  CSV.open( "#{Rails.root}/lib/event_queries.csv", 'r', '\n' ) do |row|
    event_queries << row.first.split( ',' ).map do |query|
      query.gsub( /[ -]/, '+' ).strip
    end
  end
  
  i = 1

  event_queries.each do |query|
    
    print "(#{i}): #{query[0]} => "
    
    results = Twitter::Search.new.containing( query[0] ).language("en")

    results.per_page(1).each do |r|
      puts "#{r.text}"
    end
    
    i += 1
  end
  
end