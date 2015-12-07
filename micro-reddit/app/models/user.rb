class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..25 }
  validates :user_name, presence: true, length: { in: 6..20 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  has_many :posts
  has_many :comments
end
