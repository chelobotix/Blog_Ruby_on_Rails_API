class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { in: 3..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_counter

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_counter
    author.increment!(:post_counter)
  end
end
