class Avatar < ActiveRecord::Base
  belongs_to :classroom
  def full_name
    [first_name, last_name].join(" ")
  end
end
