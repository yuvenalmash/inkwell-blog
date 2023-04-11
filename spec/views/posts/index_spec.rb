require 'rails_helper'

RSpec.feature 'Posts index', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author: @user)
    @post2 = FactoryBot.create(:post, author: @user)
    @post3 = FactoryBot.create(:post, author: @user)
    @post4 = FactoryBot.create(:post, author: @user)
    @post5 = FactoryBot.create(:post, author: @user)
    @post6 = FactoryBot.create(:post, author: @user)
    @comment1 = FactoryBot.create(:comment, post: @post6, author: @user)
    @comment2 = FactoryBot.create(:comment, post: @post6, author: @user)
    @comment3 = FactoryBot.create(:comment, post: @post6, author: @user)
    visit user_posts_path(@user)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content(@user.posts.count)
  end

  scenario 'I can see the title of all posts' do
    expect(page).to have_content(@post6.title)
    expect(page).to have_content(@post5.title)
    expect(page).to have_content(@post4.title)
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content(@post6.text[0..100])
    expect(page).to have_content(@post5.text[0..100])
    expect(page).to have_content(@post4.text[0..100])
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  scenario 'I can see the number of comments each post has' do
    expect(page).to have_content(@post6.comments.count)
    expect(page).to have_content(@post5.comments.count)
    expect(page).to have_content(@post4.comments.count)
  end

  scenario 'I can see the number of likes each post has' do
    expect(page).to have_content(@post6.likes.count)
    expect(page).to have_content(@post5.likes.count)
    expect(page).to have_content(@post4.likes.count)
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_css('.pagination')
  end

  scenario 'When I click on a post, I am redirected to that post show page' do
    click_link(@post6.title)
    expect(current_path).to eq(user_post_path(@user, @post6))
  end
end
