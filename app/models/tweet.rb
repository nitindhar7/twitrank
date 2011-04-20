class Tweet < ActiveRecord::Base
  belongs_to :query
  
  def self.per_page
    50
  end
end