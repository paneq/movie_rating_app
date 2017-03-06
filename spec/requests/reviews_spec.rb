require 'rails_helper'

describe 'New review', :type => :feature do
  it 'creates new review' do
    user = FactoryGirl.build(:user)
    sign_in user
    visit root_path
    
  end
end