Twitrank
========

Overview
--------
Twitrank is simply a tweet ranking system. Just add events with some details to calibrate Twitrank and it will find tweets for events that
are searched in ranked in order of relevance.

Setup
-----
Twitrank is easy to setup. 2 sample configuration files are created:

1.	config/database.example.yml
	* This is the default database configuration created by rails. Just add in your customer database details.
2.	config/initializers/twitter.rb.example
	* This is the Twitter configuration file where you add your Twitter consumer key/secret and your Twitter OAuth token/secret
	* Example:
		Twitter.configure do |config|
		  config.consumer_key = YOUR_CONSUMER_KEY
		  config.consumer_secret = YOUR_CONSUMER_SECRET
		  config.oauth_token = YOUR_OAUTH_TOKEN
		  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
		end	




Architecture
------------ 