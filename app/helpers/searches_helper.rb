module SearchesHelper
  def twitter_request_count
    Twitter::Client.new.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour"
  end
end
