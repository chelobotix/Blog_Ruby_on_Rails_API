require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Natasha', photo: 'https://Natish.com', bio: 'Queen') }
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.post_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Should return last three post of a user' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Post.create(author: user1, title: 'Title 2', text: 'Text 2', comments_counter: 0, likes_counter: 0)
    Post.create(author: user1, title: 'Title 3', text: 'Text 3', comments_counter: 0, likes_counter: 0)

    expect(user1.last_three_posts.length).to eq(3)
  end
end
