require 'rails_helper'

describe User, type: :model do
  it 'Should comment counter should be 1' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    post1 = Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Comment.create(author: user1, post: post1, text: 'comment 1')
    expect(post1.comments_counter).to eq(1)
  end

  it 'Should comment increment by 1 everytime that new comment has added' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    post1 = Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Comment.create(author: user1, post: post1, text: 'comment 1')
    Comment.create(author: user1, post: post1, text: 'comment 2')
    Comment.create(author: user1, post: post1, text: 'comment 3')
    expect(post1.comments_counter).to eq(3)
  end
end
