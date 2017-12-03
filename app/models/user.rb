class User < ApplicationRecord

  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }

  # validate :add_errors
  # def add_errors
  #   if User.find_by(email: email) == nil
  #     errors[:base] << "ログインできません"
  #   end
  # end

  has_secure_password
  validates :password, presence: true, length: { minimum:6 }

end
