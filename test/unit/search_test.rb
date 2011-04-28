require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  
  def test_a_basic_search
    assert_equal true, searches(:search1).valid?
  end
  
  def test_length_of_attributes
    assert_equal false, searches(:search2).valid?
    assert_equal false, searches(:search3).valid?
  end
end
