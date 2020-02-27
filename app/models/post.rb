class Post < ApplicationRecord
  validates :text, :image, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end

  # 以下のような書き方も出来る
  # def self.search(search)
  #   if search
  #     Post.where('text LIKE(?)', "%#{search}%")
  #   else
  #     Post.all
  #   end
end