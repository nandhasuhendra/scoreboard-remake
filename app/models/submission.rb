class Submission < ActiveRecord::Base
  validates :submission, uniqueness: { scope: :submiter_id, case_sensitive: false }, if: :is_correct?

  belongs_to  :owner,     class_name: 'User'
  belongs_to  :submiter,  class_name: 'User'
  belongs_to  :challenge

  has_many    :flag

  def is_correct?
    is_correct.eql? true
  end
end
