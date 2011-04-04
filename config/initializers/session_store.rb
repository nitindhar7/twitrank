# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitrank_session',
  :secret      => '9a79a27eb73b4e4a5fc42b8b9f0ab614c547e94f09c45efd55e1567f5b1e1c5a7e6650ce5a20ae0976ec302cb26f1bdd712397d9abd76249cb83d0dff12ecd03'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
