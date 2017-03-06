require 'rails_helper'

describe 'New movie', :type => :feature do
  it 'create a new movie' do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.build(:movie)
    sign_in user
    visit root_path
    expect(page).to have_content('Log out')
    visit new_movie_path
    click_button 'Create Movie'
    puts "Movies count"
    puts Movie.all.count
    expect { movie.save }.to change(Movie.all, :count).by(1)
  end
end