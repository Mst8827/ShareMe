class Post < ApplicationRecord
  validates :text, :image, :movie, presence: true
end
