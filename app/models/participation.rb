class Participation < ActiveRecord::Base
  belongs_to :avatar
  belongs_to :task
end
