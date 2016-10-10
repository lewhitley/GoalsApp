require 'spec_helper'
require 'rails_helper'

feature "Users Index" do
  before(:each) do
    10.times { FactoryGirl.create(:user) }
  end

  scenario "should list all users" do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.username)
    end
  end
  scenario "should link to user profiles" do
    user = User.first
    visit users_path
    click_on user.username
    expect(page).to have_content("#{user.username}'s Profile")
  end

end

feature "User Show" do
  before(:each) do
    user = FactoryGirl.create(:user)
    3.times { FactoryGirl.create(:goal) }
  end

  scenario "should list user's goals" do
    User.first.goals.each do |goal|
      expect(page).to have_content(goal.title)
    end
  end

  scenario "should display comments on user"
  scenario "should allow adding comments"
  scenario "should link to user's goals"
  scenario "should have button to cheer"
  scenario "should have button to complete if owner"
end
