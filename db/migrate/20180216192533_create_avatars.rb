class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :pesel
      t.string :card_number
      t.integer :card_cvv
      t.integer :card_expire_month
      t.integer :card_expire_year
      t.string :photo_url

      t.string :code

      t.timestamps null: false
    end
  end
end
