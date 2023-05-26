require 'rails_helper'

RSpec.describe 'Show users page', type: :system do
  before :each do
    user1 = User.create(
      id: 10,
      name: 'Rodrigo',
      photo: 'https://randomuser.me/api/portraits/men/31.jpg',
      bio: 'Awesome User',
      post_counter: 0
    )
    Post.create(id: 1, title: 'Post Number 1', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Post.create(id: 2, title: 'Post Number 2', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Post.create(id: 3, title: 'Post Number 3', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Post.create(id: 4, title: 'Post Number 4', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
  end
  describe 'show page' do
    it 'should show the user profile picture' do
      visit user_path(id: 10)
      expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/31.jpg"]')
    end

    it 'should show the username' do
      visit user_path(id: 10)
      expect(page).to have_content('User: Rodrigo')
    end

    it 'should show the number of user posts' do
      visit user_path(id: 10)
      expect(page).to have_content('Number of posts: 4')
    end

    it 'should show the user Bio' do
      visit user_path(id: 10)
      expect(page).to have_content('Awesome User')
    end

    it 'should show the last 3 posts' do
      visit user_path(id: 10)
      last_post = page.all('.last_post').count
      expect(last_post).to eq(3)
    end

    it 'should show the user Bio' do
      visit user_path(id: 10)
      expect(page).to have_content('Awesome User')
    end

    it 'should have a button that lets view all user posts' do
      visit user_path(id: 10)
      expect(page).to have_link(class: 'all_posts_btn')
    end

    it 'should redirected to specific post page' do
      visit user_path(id: 10)
      page.all(:link, 'last_post_a').last.click
      expect(page).to have_current_path('/users/10/posts/2')
    end

    it 'should redirected to index post page' do
      visit user_path(id: 10)
      page.all(:link, class: 'all_posts_btn').last.click
      expect(page).to have_current_path('/users/10/posts')
    end
  end
end
