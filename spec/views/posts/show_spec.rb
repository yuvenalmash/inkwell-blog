require 'rails_helper'

RSpec.describe 'show posts page', type: :feature do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author: @user1)
    @comment1 = FactoryBot.create(:comment, author: @user2, post: @post1)
    visit user_post_path(@user1, @post1)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content(@post1.title)
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see how many comments it has' do
    expect(page).to have_content('Comments: 1')
  end

  scenario 'I can see how many likes it has' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'I can see the post body' do
    expect(page).to have_content(@post1.text)
  end

  scenario 'I can see the username of each commentor' do
    expect(page).to have_content(@user2.name)
  end

  scenario 'I can see the comment each commentor left' do
    expect(page).to have_content(@comment1.text)
  end
end
