require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  
  def test_a_basic_query
    assert_equal true, queries(:q1).valid?
  end
  
  def test_presence_of_attributes
    assert_equal false, queries(:q2).valid?
    assert_equal false, queries(:q3).valid?
    assert_equal false, queries(:q4).valid?
    assert_equal false, queries(:q5).valid?
    assert_equal false, queries(:q6).valid?
    assert_equal true, queries(:q7).valid?
  end
  
  def test_length_of_attributes
    assert_equal false, queries(:q8).valid?
    assert_equal false, queries(:q9).valid?
    assert_equal false, queries(:q12).valid?
    assert_equal false, queries(:q13).valid?
  end
  
  def test_format_of_attributes
    assert_equal false, queries(:q10).valid?
    assert_equal false, queries(:q11).valid?
  end
  
  # FLUNKS
  
  def test_numericality_of_attributes
    flunk( "Latitude cannot be a string" )#assert_equal false, queries(:q14).valid?
    flunk( "Longitude cannot be a string" )#assert_equal false, queries(:q15).valid?
    flunk( "Status cannot be a string" )#assert_equal false, queries(:q16).valid?
  end
  
end
