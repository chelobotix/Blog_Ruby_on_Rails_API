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
                        text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque autem ipsa offics.',
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
    it 'should show the post title' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('Post Number 1')
    end

    it 'should show the post author' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('by Rodrigo')
    end

    it 'should show total comments' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('comments: 1')
    end

    it 'should show total likes' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('likes: 1')
    end

    it 'should show post body' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque autem ipsa')
    end

    it 'should show username of each comment' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('Rodrigo:')
    end

    it 'should show comment every user made' do
      visit user_post_path(user_id: 10, id: 1)
      expect(page).to have_content('Awesome post!')
    end
  end
end
