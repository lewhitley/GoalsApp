require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before(:each) { visit new_user_path }

  scenario "has a new user page" do
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      fill_in ('username', with: 'bob')
      fill_in ('password', with: 'asdfasdf')
      click_on "Submit"

      expect(page).to have_content("bob")
    end
  end
end

feature "logging in" do
  before do
    visit new_user_path
    fill_in ('username', with: 'bob')
    fill_in ('password', with: 'asdfasdf')
    click_on "Submit"
    click_on "Logout"
  end
  scenario "shows username on the homepage after login" do
    visit new_session_path
    fill_in ('username', with: 'bob')
    fill_in ('password', with: 'asdfasdf')
    click_on "Login"

    expect(page).to have_content("bob")
  end
end

feature "logging out" do
  scenario "begins with a logged out state" do
    visit '/'
    expect(page).to have_content("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_user_path
    fill_in ('username', with: 'bob')
    fill_in ('password', with: 'asdfasdf')
    click_on "Submit"
    click_on "Logout"
    expect(page).not_to have_content('bob')
  end

end
