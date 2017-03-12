require 'rails_helper'

describe 'Logged in user can add a new movie', :type => :feature do
  it 'creates a new movie' do
    user = FactoryGirl.create(:user)
    sign_in user
    visit root_path
    expect(page).to have_content('Log out')
    visit new_movie_path
    find('#movie_category_id').find(:xpath, 'option[1]').select_option
    fill_in 'Movie title', with: 'The Walking Dead'
    fill_in 'Description', with: 'A group of survivors try to survive in the apocalyptic world overrun by zombies'
    fill_in 'Director', with: 'Test director'
    fill_in 'Movie length', with: 45
    attach_file('Image', 'spec/support/The_Walking_Dead.jpg')
    click_button 'Create Movie'
    visit root_path
    page.find('.movie')['src'].should have_content 'The_Walking_Dead.jpg'
  end
end

describe 'Non-logged in user cannot add a new movie', :type => :feature do
  it 'asks the user to log in before he can add a new movie' do
    visit root_path
    visit new_movie_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end