# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#followed_by' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not she.followed_by?(me)
    me.follow(she)
    assert she.followed_by?(me)
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#name_or_email' do
    user = User.new(email: 'hoge@example.com')
    assert_equal 'hoge@example.com', user.name_or_email
  end
end
