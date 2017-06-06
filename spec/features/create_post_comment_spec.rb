require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'home page' , :type => :feature do
  
  test_user_email  = "santhoshror@gmail.com"
  test_user_password  = "password1"
  test_post = FactoryGirl.create(:post)
  test_comment = FactoryGirl.create(:comment)
  it 'welcomes the user' do
    visit '/'
    fill_in "user_email", :with => test_user_email
    fill_in "user_password", :with => test_user_password
    click_button "Log in"
    
    expect(page).to have_xpath("//a[.='Logout']")
    
    click_link "Create New Post"
    fill_in "post_title", :with => test_post.title
    fill_in "post_body", :with => test_post.body
    click_on "Create Post"
    
    expect(page).to have_content(test_post.title)
    
    click_link "Add Comment"
    fill_in "comment_body", :with => test_comment.body
    click_on "Post"
    
    expect(page).to have_content(test_comment.body)

  end
end
