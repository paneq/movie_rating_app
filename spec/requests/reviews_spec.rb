require 'rails_helper'

describe 'Logged in user can create a new review', :type => :feature do
  it 'creates new review' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_link 'The walking dead'
    click_link 'Add Review'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Password', with: 'Password'
    click_button 'Log in'
    fill_in 'Comment', with: 'Great movie! Must see!'
    click_button 'Create Review'
    expect(page).to have_content 'Great movie! Must see!'
  end
end

describe 'Logged in user can update a review', :type => :feature do
  it 'updates a review' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_link 'The walking dead'
    click_link 'Add Review'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Password', with: 'Password'
    click_button 'Log in'
    fill_in 'Comment', with: 'Great movie! Must see!'
    click_button 'Create Review'
    click_link 'Edit'
    fill_in 'Comment', with: 'Great movie! Must see! My favourite'
    click_button 'Update Review'
    expect(page).to have_content 'Great movie! Must see! My favourite'
  end
end

describe 'Non-logged in user cannot add a new review', :type => :feature do
  it 'asks the user to log in before he can add a new review' do
    visit root_path
    click_link 'The walking dead'
    click_link 'Add Review'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end

describe 'Non-logged in user can see reviews', :type => :feature do
  it 'user can see a list of reviews' do
    visit root_path
    click_link 'The walking dead'
    expect(page).to have_content 'My test review comment'
    expect(page).to have_content 'Average Rating'
  end
end