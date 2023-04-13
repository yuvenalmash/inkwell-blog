class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy, counter_cache: :comments_counter
  has_many :likes, dependent: :destroy
  # has_many :liking_users, through: :likes, source: :author

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
  validates :likes_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def liked_by?(user)
    likes.exists?(author: user)
  end

  after_create :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
