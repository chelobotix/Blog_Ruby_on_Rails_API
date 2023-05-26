require 'rails_helper'

describe User, type: :model do
  subject do
    user = User.new(name: 'Natasha', photo: 'https://Natish.com', bio: 'Queen')
    Post.new(author: user, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
  end

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should be eq to Title 1' do
    expect(subject.title).to eq('Title 1')
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'One morning, when Gregor Samsa woke from troubled dreams,
    he found himself transformed in his bed into a horrible vermin.
    He lay on his armour-like back, and if he lifted his head a little he could
    see his brown belly, slightly domed and divided by arches'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Should return last last_five_comments' do
    user1 = User.create(name: 'Natasha', post_counter: 0)
    post1 = Post.create(author: user1, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Comment.create(author: user1, post: post1, text: 'comment 1')
    Comment.create(author: user1, post: post1, text: 'comment 2')
    Comment.create(author: user1, post: post1, text: 'comment 3')
    Comment.create(author: user1, post: post1, text: 'comment 4')
    Comment.create(author: user1, post: post1, text: 'comment 5')
    Comment.create(author: user1, post: post1, text: 'comment 6')

    expect(post1.last_five_comments.length).to eq(5)
  end
end
