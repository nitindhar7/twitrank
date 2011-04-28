class Search < ActiveRecord::Base
  
  # VALIDATIONS
  validates_presence_of :query
  validates_length_of :query, :in => 1..100
end
