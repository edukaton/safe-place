class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :avatar_id
      t.integer :task_id
      t.boolean :completed
      t.string :status

      t.timestamps null: false
    end
  end
end
