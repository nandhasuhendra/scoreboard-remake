class User < ActiveRecord::Base 
  validates :username, presence: true, length: { in: 6..200 }, uniqueness: true
  validates :password, presence: true, length: { in: 6..200 }
end
