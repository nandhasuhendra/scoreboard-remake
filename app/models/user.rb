class User < ActiveRecord::Base 
  include BCrypt

  has_many  :flag,        dependent: :destroy
  has_many  :owner,       dependent: :destroy, class_name: 'Submission', foreign_key: 'owner_id'
  has_many  :submiter,    dependent: :destroy, class_name: 'Submission', foreign_key: 'submiter_id'

  validates :teamname, presence: true, length: { in: 3..200 }, uniqueness: {scope: :teamname, case_sensitive: false }
  validates :username, presence: true, length: { in: 3..200 }, uniqueness: {scope: :username, case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { in: 8..200 }, confirmation: true, on: :create
  validates :password, presence: true, length: { in: 8..200 }, confirmation: true, on: :update, if: :password_changed?

  def password_changed?
    !password.blank?
  end
  
  def self.first_or_create(params = {})
    find = where(username: params[:username]).first

    return find unless find.nil?

    create(params)
  end
end
