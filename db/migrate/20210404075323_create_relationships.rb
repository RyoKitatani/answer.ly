class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false
      t.index ["follower_id"], name: "index_relationships_on_follower_id"
      t.index ["followed_id"], name: "index_relationships_on_followed_id"
      t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true

      t.timestamps
    end
  end
end
