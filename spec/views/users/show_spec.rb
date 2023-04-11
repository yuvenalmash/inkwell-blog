require "rails_helper"

RSpec.feature "Users show", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author: @user)
    @post2 = FactoryBot.create(:post, author: @user)
    @post3 = FactoryBot.create(:post, author: @user)
    visit user_path(@user)
  end

  scenario "I can see the user's username" do
    expect(page).to have_content(@user.name)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  scenario "I can see the number of posts the user has written" do
    expect(page).to have_content(@user.posts.count)
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content(@user.bio)
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_link("See all posts")
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    click_link(@post1.title)
    expect(current_path).to eq(user_post_path(@user, @post1))
  end

  scenario "When I click the 'See all posts' button, it redirects me to that user's posts index page" do
    click_link("See all posts")
    expect(current_path).to eq(user_posts_path(@user))
  end
end
