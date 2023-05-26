require 'rails_helper'

describe User, type: :model do
  it 'Should like counter should be 1' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    post1 = Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Like.create(author: user1, post: post1)
    expect(post1.likes_counter).to eq(1)
  end

  it 'Should like increment by 1 everytime that new like has added' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    post1 = Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Like.create(author: user1, post: post1)
    Like.create(author: user1, post: post1)
    Like.create(author: user1, post: post1)
    expect(post1.likes_counter).to eq(3)
  end
end
