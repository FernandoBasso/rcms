class PostCategory < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 10, maximum: 199 }

end
