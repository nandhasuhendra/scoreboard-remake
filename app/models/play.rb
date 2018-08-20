class Play < ActiveRecord::Base
  def self.first_or_create(params = {})
    find = first

    if find.nil?
      create(params)
    else
      update(params)
    end
  end
end
