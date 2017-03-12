require 'rails_helper'

describe 'Logged in user can add a new movie', :type => :feature do
  it 'create a new movie' do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.build(:movie)
    sign_in user
    visit root_path
    expect(page).to have_content('Log out')
    visit new_movie_path
    click_button 'Create Movie'
    expect { movie.save }.to change(Movie.all, :count).by(1)
  end
end

describe 'Non-logged in user cannot add a new movie', :type => :feature do
  it 'asks the user to log in before he can add a new movie' do
    visit root_path
    visit new_movie_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end