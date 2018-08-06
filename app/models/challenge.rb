class Challenge < ActiveRecord::Base
  belongs_to  :category

  has_many    :flag,        dependent: :destroy
  #has_many    :submission,  dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :score, presence: true, numericality: true
  validates :real_flag, uniqueness: true, allow_blank: true
end
