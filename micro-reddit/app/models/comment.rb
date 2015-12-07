class Comment < ActiveRecord::Base
  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :post
end
