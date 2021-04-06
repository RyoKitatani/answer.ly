class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
    add_column :members, :image, :string
  end
end
