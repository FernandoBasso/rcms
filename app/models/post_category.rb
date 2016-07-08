class PostCategory < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 10, maximum: 199 }

  # TODO: Instead of destroying posts from a given category, we could
  # first add them to a “no category” category.
  has_many :posts, dependent: :destroy

end
