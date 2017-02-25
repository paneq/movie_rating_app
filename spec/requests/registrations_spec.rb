require 'spec_helper'


RSpec.describe "Registrations", type: :request do
  describe "registration" do
    it "creates a new user" do
      visit new_user_registration_path
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content "created"
    end
  end
end
