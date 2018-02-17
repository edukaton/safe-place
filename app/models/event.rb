class Event < ActiveRecord::Base
  belongs_to :participation
  belongs_to :classroom
end
