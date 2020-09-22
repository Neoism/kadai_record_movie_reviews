class Post < ApplicationRecord
  belongs_to :user
  has_many   :helpfuls
  validates :title, presence: true
  validates :watched_on, presence: true
  validates :theater, presence: true
  validates :comment, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def self.search(search)
    if search.present?
      posts = Post.where('title LIKE ?', "%#{search}%")
    else
      posts = Post.none
    end
  end
end
