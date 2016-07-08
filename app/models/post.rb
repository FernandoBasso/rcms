class Post < ApplicationRecord

  validates :title, presence: true, length: { minimum: 2 }
  validates :intro, presence: true, length: { minimum: 10, maximum: 199 }
  validates :text, presence: true, length: { minimum: 10 }
  validates :post_category_id, presence: true

  belongs_to :post_category

end
