class CreateAnswerLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_likes do |t|
      t.references :answer, foreign_key: true, null: false
      t.references :member, foreign_key: true, null: false

      t.timestamps
    end
  end
end
