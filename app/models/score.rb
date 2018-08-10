class Score < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :user_id }

  belongs_to :user
  
  def self.first_or_create(params = {})
    find = where(user_id: params[:user_id]).first

    return find unless find.nil?

    create(params)
  end
end
