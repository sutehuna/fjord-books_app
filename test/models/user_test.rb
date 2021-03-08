# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @me = User.create!(email: 'me@example.com', password: 'password')
    @she = User.create!(email: 'she@example.com', password: 'password')
  end

  test '#following?' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#followed_by' do
    assert_not @she.followed_by?(@me)
    @me.follow(@she)
    assert @she.followed_by?(@me)
  end

  test '#follow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#unfollow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end

  test '#name_or_email' do
    assert_equal 'me@example.com', @me.name_or_email
  end
end
