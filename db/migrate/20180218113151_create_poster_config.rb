class CreatePosterConfig < ActiveRecord::Migration
  def change
    create_table :poster_configs do |t|
      t.string :base_url, null: false
      t.string :secure_base_url, null: false
    end
  end
end
