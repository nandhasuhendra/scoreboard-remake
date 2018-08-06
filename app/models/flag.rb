class Flag < ActiveRecord::Base
  belongs_to  :challenge
  belongs_to  :user

  validates :flag, presence: true, uniqueness: true

  def self.first_or_create(params = {})
    find = where(flag: params[:flag]).first

    return find unless find.nil?

    create(params)
  end
end
