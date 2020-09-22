class Post < ApplicationRecord
  belongs_to :user
  has_many   :helpfuls
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def self.search(search)
    if search
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
