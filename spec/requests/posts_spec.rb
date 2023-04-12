require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /posts' do
    it 'assigns all posts to @posts' do
      post1 = FactoryBot.create(:post, author: user)
      post2 = FactoryBot.create(:post, author: user)
      get user_posts_path(user)
      expect(assigns(:posts)).to match_array([post1, post2])
    end

    it 'responds with a 200 status code' do
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end

    it 'response body includes the title of the first post' do
      post = FactoryBot.create(:post, author: user)
      get user_posts_path(user)
      expect(response.body).to include(post.title)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /posts/:id' do
    let(:post) { FactoryBot.create(:post, author: user) }

    it 'assigns the requested post to @post' do
      get user_post_path(user, post)
      expect(assigns(:post)).to eq(post)
    end

    it 'responds with a 200 status code' do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end

    it 'response body includes the title of the post' do
      get user_post_path(user, post)
      expect(response.body).to include(post.title)
    end

    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template('show')
    end
  end
end
