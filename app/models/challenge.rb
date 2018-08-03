class Challenge < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :score, presence: true, numericality: true
  validates :real_flag, uniqueness: true, on: :update
end
