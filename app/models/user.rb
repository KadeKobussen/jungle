class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, presence: true
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.where('lower(email) = ?', email).first
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
