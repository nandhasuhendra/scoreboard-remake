class User < ActiveRecord::Base 
  include BCrypt

  validates :username, presence: true, length: { in: 3..200 }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { in: 8..200 }, confirmation: true, on: :create
  validates :password, presence: true, length: { in: 8..200 }, confirmation: true, on: :update, if: :password_changed?

  def password_changed?
    !password.blank?
  end

  # def password=(new_password)
  #   write_attribute(:password, Password.create(new_password))
  # end
end
