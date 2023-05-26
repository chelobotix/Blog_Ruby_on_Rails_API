require 'rails_helper'

RSpec.describe 'Index users page', type: :system do
  before :each do
    user1 = User.create(
      id: 10,
      name: 'Rodrigo',
      photo: 'https://randomuser.me/api/portraits/men/31.jpg',
      bio: 'Awesome User',
      post_counter: 0
    )
    Post.create(
      id: 1,
      title: 'Post Number 1',
      text: 'Lorem Ipsu',
      likes_counter: 0,
      comments_counter: 0,
      author: user1
    )
  end
  describe 'index page' do
    it 'should show the username of all other users' do
      visit users_path
      expect(page).to have_content('User: Rodrigo')
    end

    it 'should show the profile picture for each user' do
      visit users_path
      expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/31.jpg"]')
    end

    it 'should show the number of posts each user has written' do
      visit users_path
      expect(page).to have_content('Number of posts: 1')
    end

    it 'should redirected to specific users show page' do
      visit users_path
      page.all(:link, 'picture_link').last.click
      expect(page).to have_current_path('/users/10')
    end
  end
end
