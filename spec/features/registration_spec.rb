require "spec_helper"

describe "registration" do
  it "creates a new user" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "created"
  end
end

describe "email registration confirmation was sent" do

end

describe "email registration instructions was received" do

end