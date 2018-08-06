class Category < ActiveRecord::Base 
  validates :category, presence: true, length: { in: 3..200 }, uniqueness: true
end
