class Query < ActiveRecord::Base
  
  # ASSOCIATIONS
  has_many :tweets
  
  # VALIDATIONS
  validates_presence_of :text, :query_date, :location, :latitude, :longitude, :status
  validates_numericality_of :latitude, :longitude, :status
  validates_length_of :text, :in => 1..100
  validates_length_of :location, :in => 1..50
end