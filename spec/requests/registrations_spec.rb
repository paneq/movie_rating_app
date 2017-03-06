require 'rails_helper'

RSpec.describe "Registration", type: :feature do
  it "creates a new user" do
    visit '/users/sign_up'
    fill_in 'Email', with: ENV['GMAIL_USERNAME'] 
    fill_in 'Password', with: ENV['TEST_PASSWORD'], id: "user_password"
    fill_in 'Password confirmation', with: ENV['TEST_PASSWORD']
    click_button 'Sign up'
    expect(page).to have_content(
      "A message with a confirmation link has been sent to your email address. 
      Please follow the link to activate your account."
    )
  end
end

RSpec.describe "email confirmation is sent out", type: :mailer do
  it "send an email" do
    u = User.new(email: ENV['GMAIL_USERNAME'], password: ENV['TEST_PASSWORD'])
      expect { u.save }.to change(
        Devise.mailer.deliveries, :count
        ).by(1)
  end
end

RSpec.describe Devise::Mailer, type: :mailer do
  it "sends an email with proper text" do
    u = User.create(email: ENV['GMAIL_USERNAME'], password: ENV['TEST_PASSWORD'])
    confirmation_email = Devise.mailer.deliveries.last
    expect(confirmation_email.body.to_s).to have_content(
      'Welcome filmratingapp@gmail.com!
      You can confirm your account email through the link below:
      Confirm my account')
    
    expect(confirmation_email.subject.to_s).to have_content(
      'Confirmation instructions')

    expect(confirmation_email.from).to have_content ENV['GMAIL_USERNAME']
    expect(confirmation_email.to).to have_content ENV['GMAIL_USERNAME']
    expect(u.confirmed?).to be false
    within confirmation_email do
      click_link("Confirm my account")
      expect(page).to have_content "Your email address has been successfully confirmed."
    end
  end
end

