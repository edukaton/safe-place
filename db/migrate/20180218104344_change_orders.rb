class ChangeOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :title
    add_column :orders, :movie_id, :integer
  end
end
