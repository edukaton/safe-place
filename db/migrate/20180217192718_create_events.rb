class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :participation_id
      t.integer :classroom_id
      t.string :event_type
      t.text :description

      t.timestamps null: false
    end
  end
end
