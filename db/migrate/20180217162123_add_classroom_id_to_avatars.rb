class AddClassroomIdToAvatars < ActiveRecord::Migration
  def change
  	add_column :avatars, :classroom_id, :integer
  end
end
