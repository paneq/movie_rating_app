require 'rails_helper'

describe "Log in in process", :type => :feature do
  it "logs me in" do
    user = FactoryGirl.create(:user)
    sign_in user
    visit root_path
    expect(page).to have_content('Log out')
  end
end