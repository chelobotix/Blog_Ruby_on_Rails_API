require 'rails_helper'

RSpec.describe 'Index posts page', type: :system do
  before :each do
    user1 = User.create(
      id: 10,
      name: 'Rodrigo',
      photo: 'https://randomuser.me/api/portraits/men/31.jpg',
      bio: 'Awesome User',
      post_counter: 0
    )
    post1 = Post.create(id: 1, title: 'Post Number 1',
                        text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque autem ipsa officiis',
                        likes_counter: 0,
                        comments_counter: 0,
                        author: user1)
    Post.create(id: 2, title: 'Post Number 2', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Post.create(id: 3, title: 'Post Number 3', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Post.create(id: 4, title: 'Post Number 4', text: 'Lorem Ipsu', likes_counter: 0, comments_counter: 0, author: user1)
    Comment.create(author: user1, post: post1, text: 'Awesome post!')
    Like.create(author: user1, post: post1)
  end
  describe 'index page' do
    it 'should show the user profile picture' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/31.jpg"]')
    end

    it 'should show the username' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('User: Rodrigo')
    end

    it 'should show the number of user posts' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Number of posts: 4')
    end

    it 'should show the post title' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Post Number 1')
    end

    it 'should show part of the post text' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Lorem ipsum dolor sit amet consectetur')
    end

    it 'should show the first comment of the post' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Awesome post!')
    end

    it 'should show the total post comments' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Comments: 1')
    end

    it 'should show the total post likes' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_content('Likes: 1')
    end

    it 'should show the pagination' do
      visit user_posts_path(user_id: 10)
      expect(page).to have_link(class: 'pagination')
    end

    it 'should click on a post, it redirects to that posts show page' do
      visit user_posts_path(user_id: 10)
      page.all(:link, class: 'last_post_a').first.click
      expect(page).to have_current_path('/users/10/posts/2')
    end
  end
end
