class AddClassroomIdToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :classroom_id, :integer
  end
end
