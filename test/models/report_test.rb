# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    alice = User.create!(email: 'alice@example.com', password: 'password')
    bob = User.create!(email: 'bob@example.com', password: 'password')
    report = Report.create!(user_id: alice.id, title: 'title1', content: 'content1')

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test "#created_on" do
    alice = User.create!(email: 'alice@example.com', password: 'password')
    report = Report.create!(user_id: alice.id, title: 'title1', content: 'content1')

    assert report.created_on == report.created_at.to_date
  end
end
