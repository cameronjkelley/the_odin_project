class User < ActiveRecord::Base
  before_create :remember
  before_save { self.email = email.downcase }

  has_many :posts

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false },
                    format: {
                      with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
                    }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def remember
      self.remember_token = User.digest(User.new_remember_token)
    end
end
