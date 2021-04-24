class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :member, foreign_key: true, null: false
      t.string  :title, null: false, default: ""
      t.text    :content, null: false
      t.integer  :best_answer_id, default: ""
      t.timestamps
    end
  end
end
