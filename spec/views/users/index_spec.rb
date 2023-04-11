require "rails_helper"

RSpec.feature "Users index", type: :feature do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:user)
    visit users_path
  end

  scenario "I can see the username of all other users" do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  scenario "I can see the profile picture for each user" do
    expect(page).to have_css("img[src*='#{@user1.photo}']")
    expect(page).to have_css("img[src*='#{@user2.photo}']")
    expect(page).to have_css("img[src*='#{@user3.photo}']")
  end

  scenario "I can see the number of posts each user has made" do
    expect(page).to have_content(@user1.posts.count)
    expect(page).to have_content(@user2.posts.count)
    expect(page).to have_content(@user3.posts.count)
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link(@user1.name)
    expect(current_path).to eq(user_path(@user1))
  end
end
