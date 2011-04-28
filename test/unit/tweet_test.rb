require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  
  def test_a_basic_tweet
    assert_equal true, tweets(:t1).valid?
    assert_equal true, tweets(:t2).valid?
  end
  
  def test_presence_of_attributes
    assert_equal false, tweets(:t3).valid?
    assert_equal false, tweets(:t4).valid?
    assert_equal false, tweets(:t5).valid?
    assert_equal false, tweets(:t6).valid?
    assert_equal true, tweets(:t7).valid?
    assert_equal false, tweets(:t12).valid?
    assert_equal false, tweets(:t13).valid?
    assert_equal false, tweets(:t14).valid?
  end
  
  def test_length_of_attributes
    assert_equal true, tweets(:t16).valid?
    assert_equal true, tweets(:t17).valid?
  end

end
