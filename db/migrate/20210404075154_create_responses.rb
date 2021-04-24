class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :answer, foreign_key: true, null: false, default: ""
      t.references :member, foreign_key: true, null: false, default: ""
      t.text       :content, null: false, default: ""

      t.timestamps
    end
  end
end
