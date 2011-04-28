require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_a_basic_user
    assert_equal true, users(:u1).valid?
  end
  
  def test_presence_of_attributes
    assert_equal false, users(:u2).valid?
    assert_equal false, users(:u3).valid?
    assert_equal false, users(:u4).valid?
    assert_equal false, users(:u5).valid?
    assert_equal false, users(:u6).valid?
    assert_equal false, users(:u7).valid?
    assert_equal false, users(:u8).valid?
    assert_equal false, users(:u9).valid?
    assert_equal false, users(:u10).valid?
  end
  
  def test_uniqueness_of_attributes
    @user = User.new({
      :email => "jdoe@example.com",
      :password_hash => "a",
      :password_salt => "b",
      :first_name => "c",
      :last_name => "d",
      :twitter_consumer_key => "e",
      :twitter_consumer_secret => "f",
      :twitter_oauth_token => "g",
      :twitter_oauth_secret => "h"
    })
    @user.save
    
    assert_equal false, @user.valid?
  end
  
  def test_format_of_attributes
    assert_equal false, users(:u12).valid?
    assert_equal false, users(:u13).valid?
    assert_equal false, users(:u14).valid?
    assert_equal false, users(:u15).valid?
    assert_equal false, users(:u16).valid?
  end
  
  def test_full_name
    assert_equal "Joe Smith", users(:u1).full_name
  end
  
end
