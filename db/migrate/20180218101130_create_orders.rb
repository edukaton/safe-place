class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :full_name
      t.string :title
      t.string :reference
      t.boolean :paid
      t.integer :amount

      t.timestamps null: false
    end
  end
end
