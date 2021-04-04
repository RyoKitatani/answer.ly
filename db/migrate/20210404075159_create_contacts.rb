class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text   :message, null: false, default: ""

      t.timestamps
    end
  end
end
