require 'rails_helper'

RSpec.describe 'show posts page', type: :feature do
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
    visit user_post_path(@user, @post1)
  end

  scenario 'show page url' do
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  scenario 'show page has post title' do
    assert page.has_content?(@post1.title)
  end

  scenario 'show page has a posts author\'s name' do
    assert page.has_content?(@user.name)
  end

  scenario 'show page has no of comments and likes on a post' do
    expect(page).to have_content('Comments: 0 Likes: 0')
  end

  scenario 'show page has a posts body' do
    assert page.has_selector?('p', text: @post1.text)
  end

  scenario 'show page has comment\'s username' do
    assert page.has_selector?('p', text: @comment1.author.name)
  end
end
