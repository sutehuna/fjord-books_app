
require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'carol@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Report' do
    visit reports_path
    click_on '日報'
    click_on '新規作成'
    fill_in 'タイトル', with: 'タイトル1'
    fill_in '内容', with: '内容1'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'タイトル1'
    assert_text '内容1'
  end
end
