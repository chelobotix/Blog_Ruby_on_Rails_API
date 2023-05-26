require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET /posts' do
    it 'return http success' do
      user1 = User.first
      get user_posts_path(user_id: user1.id)
      expect(response).to have_http_status(200)
    end

    it 'render correct posts template' do
      user1 = User.first
      get user_posts_path(user_id: user1.id)
      expect(response).to render_template 'index'
    end

    it 'render correct posts/show template' do
      user1 = User.first
      get user_posts_path(user_id: user1.id)
      expect(response).to render_template 'index'
    end
  end
end

RSpec.describe 'Response body includes correct placeholder text:', type: :feature do
  scenario 'should content User Post Home text' do
    user1 = User.first
    visit "/users/#{user1.id}/posts"
    expect(page).to have_content('User:')
  end
end
