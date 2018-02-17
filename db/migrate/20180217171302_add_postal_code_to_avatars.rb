class AddPostalCodeToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :postal_code, :string
  end
end
