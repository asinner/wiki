require 'test_helper'

feature 'pages' do
  scenario '#edit' do
    sign_in
    visit page_path(pages(:one))    
    page.text.wont_include users(:one).email
    click_link 'Edit'
    fill_in 'Body', with: 'Updated content'
    click_button 'Update'
    page.text.must_include 'Updated content'
    page.text.must_include users(:one).email
    visit user_path(users(:one))
    page.text.must_include pages(:one).title
  end
end