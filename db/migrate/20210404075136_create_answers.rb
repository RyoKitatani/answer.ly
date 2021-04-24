class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true, null: false
      t.references :member, foreign_key: true, null: false
      t.text       :content, null: false

      t.timestamps
    end
  end
end
