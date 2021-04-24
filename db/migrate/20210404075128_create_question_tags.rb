class CreateQuestionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :question_tags do |t|
      t.references :question, foreign_key: true, null: false, default: ""
      t.references :tag, foreign_key: true, null: false, default: ""

      t.timestamps
    end
  end
end
