require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users (#index)' do
    it 'assigns all users to @users' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      get users_path
      expect(assigns(:users)).to eq([user1, user2])
    end

    it 'response body includes the name of the first user' do
      user = FactoryBot.create(:user)
      get users_path
      expect(response.body).to include(user.name)
    end

    it 'renders the users index template' do
      FactoryBot.create(:user)
      FactoryBot.create(:user)
      get users_path
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /users/:id (#show)' do
    let(:user) { FactoryBot.create(:user) }

    it 'assigns the requested user to @user' do
      get user_path(user)
      expect(assigns(:user)).to eq(user)
    end

    it 'responds with a 200 status code' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template('show')
    end

    it 'response body includes the name of the user' do
      get user_path(user)
      expect(response.body).to include(user.name)
    end
  end
end
