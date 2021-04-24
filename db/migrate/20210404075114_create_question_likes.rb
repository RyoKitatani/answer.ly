class CreateQuestionLikes < ActiveRecord::Migration[5.2]

  def change
    create_table :question_likes do |t|
      t.references :question, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end