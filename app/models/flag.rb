class Flag < ActiveRecord::Base
  validates :flag, uniqueness: true
end
