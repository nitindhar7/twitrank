Twitrank
========

Overview
--------
Twitrank is simply a tweet re-ranking system. Just add events with some details to calibrate Twitrank and it will find tweets for events
ranked in order of relevance, which is assigned on a graded scale. More on this in the architecture section.

Twitrank uses open source libraries in its ranking algorithms and to fetch data from Twitter:

1. twitter - http://twitter.rubyforge.org/ by John Nunemaker
2. geokit - http://geokit.rubyforge.org/ by Andre Lewis and Bill Eisenhauer
3. sofia-ml - http://code.google.com/p/sofia-ml/ by sculleyd@gmail.com, dsculley@google.com and gmann@google.com

Setup
-----
Twitrank is easy to setup. 2 sample configuration files are created:

1. config/database.example.yml
	* This is the default database configuration created by rails. Just add in your custom database details.
2. config/initializers/twitter.rb.example
	* This is the Twitter configuration file where you add your Twitter consumer key/secret and your Twitter OAuth token/secret

twitter.rb.example:

	Twitter.configure do |config|
		config.consumer_key = YOUR_CONSUMER_KEY
		config.consumer_secret = YOUR_CONSUMER_SECRET
		config.oauth_token = YOUR_OAUTH_TOKEN
		config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
	end

Tweets are fetched in pages. Each page can have upto 100 tweets if available. This option can be set in the tweet model 'app/models/Tweet.rb'
View the model method "per_page" to change this setting.

tweet.rb:

	def self.per_page
		50
	end   

Architecture
------------
Our system is composed of five main components:

1. **Creating event queries** Manually build 50 queries to use as input to the next component.
2. **Querying Twitter** Using the queries selected manually in the previous step we interface with the Twitter API and retrieve tweets returned by searching each query. Each tweet will contain the tweet body as well as metadata associated with it including a timestamp, retweet count and location. We will use some of this metadata as ranking signals in the following steps.
3. **Judging Phase** Editors judge each tweet to determine whether it is relevant to its associated query. We will create n-tuples each containing ranking signals such as percent query keywords matched, tweet age, user location and retweet count. Given this metadata the editor has judge whether the tweet is relevant to the query. For this experiment, we assume that an editors’ judgment is satisfactorily accurate.
4. **Optimization and Training** To generalize the process of judging tweets we optimize our n-tuples using sofia-ml, which is a “suite of fast incremental algorithms for machine learning”. sofia-ml can be used to train models for ranking and is highly configurable. We use sofia to generate an optimization function, which we use to train our system iteratively. Once the function outputs satisfactory results we test and evaluate the system
5. **Test and Evaluate** To test our system, we divide the data set into 5 mutually exclusive segments and run cross-referencing experiments. One segment is assigned to be the training set and we evaluate the other 4 segments. This is repeated until each segment has been assigned to be the training set once.

Some assumptions that the system makes:

1. Users are interested in information about an event. They are only interested in opinions that include relevant information about an event.
2. They are interested in both text and links within tweets. A tweet is of some value even if its either its text or a link in it is subpar. Although it may not be as valuable as a tweet whose text and link, both, are relevant.
3. “Relevant” means that it includes facts about the event itself and is topically relevant to the event.

Relevance assignment (0 - 3):

0. **No relevance**
	* All information is topically irrelevant to the event.
	* The text and links are completely unrelated to the event
	* There is no information given about the event and any opinions are unrelated to the event itself
	* Keywords are present but are not about the event or the text is about something else topically
1. **Somewhat relevant**
	* There is some topically irrelevant information present, but there is also some relevant information.
	* Either the text or link is unrelated to the event or uninformative.
	* Keywords may match but no relevant information is given – the tweet does not provide much information about the event and any opinions do not contain information about the event.
2. **Mostly relevant**
	* Although some information may not be correct or may be pure opinion, there is still mostly topically relevant information about the event.
	* Perhaps the link is incorrect or the text is mostly opinion, but the tweet is mostly about the event
	* Keywords match and the tweet is topically relevant, or the link is relevant although there is not as much relevant text.
3. **Highly relevant**
	* All information present is correct and relevant.
	* The text and links are completely related to the event and new or interesting information is given.

Authors
-------

1. Nitin Dhar - nitindhar7[at]yahoo.com
2. Maggie Neuwald - maggie.neuwald[at]gmail.com
3. Quentin Swain - qswain2[at]gmail.com