class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :description, null: false
      t.string :title, null: false
      t.decimal :popularity, null: false
      t.string :poster_path, null: false
    end
  end
end
