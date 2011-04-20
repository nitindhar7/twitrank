Twitrank
========

Overview
--------
Twitrank is simply a tweet ranking system. Just add events with some details to calibrate Twitrank and it will find tweets for events that
are searched in ranked in order of relevance.

Twitrank uses open source libraries in its ranking algorithms and to fetch data from Twitter:

1. twitter - http://twitter.rubyforge.org/ by John Nunemaker
2. geokit - http://geokit.rubyforge.org/ by Andre Lewis and Bill Eisenhauer
3. sofia-ml - http://code.google.com/p/sofia-ml/ by sculleyd@gmail.com, dsculley@google.com and gmann@google.com

Setup
-----
Twitrank is easy to setup. 2 sample configuration files are created:

1. config/database.example.yml
	* This is the default database configuration created by rails. Just add in your customer database details.
2. config/initializers/twitter.rb.example
	* This is the Twitter configuration file where you add your Twitter consumer key/secret and your Twitter OAuth token/secret

Example:

	Twitter.configure do |config|
		config.consumer_key = YOUR_CONSUMER_KEY
		config.consumer_secret = YOUR_CONSUMER_SECRET
		config.oauth_token = YOUR_OAUTH_TOKEN
		config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
	end

Architecture
------------
Our system is composed of five main components:

1. *Creating event queries* Manually build 50 queries to use as input to the next component.

2. Querying Twitter

Using the queries selected manually in the previous step we will use a Ruby library to interface with the Twitter API and retrieve tweets returned by searching each query. Each tweet will contain the tweet body as well as metadata associated with it including a timestamp, retweet count and location. We will use some of this metadata as ranking signals in the following steps.

3. Judging Phase

Editors judge each tweet to determine whether it is relevant to its associated query. We will create n-tuples each containing ranking signals such as percent query keywords matched, tweet age, user location and retweet count. Given this metadata the editor has judge whether the tweet is relevant to the query. For this experiment, we assume that an editors’ judgment is satisfactorily accurate.

4. Optimization and Training

To generalize the process of judging tweets we optimize our n-tuples using sofia-ml, which is a “suite of fast incremental algorithms for machine learning”. sofia-ml can be used to train models for ranking and is highly configurable. We use sofia to generate an optimization function, which we use to train our system iteratively. Once the function outputs satisfactory results we test and evaluate the system

5. Test and Evaluate

To test our system, we divide the data set into 5 mutually exclusive segments and run cross-referencing experiments. One segment is assigned to be the training set and we evaluate the other 4 segments. This is repeated until each segment has been assigned to be the training set once.