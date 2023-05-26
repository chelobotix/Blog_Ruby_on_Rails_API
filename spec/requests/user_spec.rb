require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'GET /users' do
    it 'return http success' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'render correct users template' do
      get '/users'
      expect(response).to render_template 'index'
    end

    it 'render correct users/show template' do
      user1 = User.first
      get "/users/#{user1.id}"
      expect(response).to render_template 'show'
    end
  end
end

RSpec.describe 'Response body includes correct placeholder text:', type: :feature do
  scenario 'should content User' do
    visit '/users'
    expect(page).to have_content('User:')
  end
end
