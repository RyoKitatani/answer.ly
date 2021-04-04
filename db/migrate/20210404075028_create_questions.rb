class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string  :title, null: false, default: ""
      t.text    :content, null: false, default: ""
      t.boolean :question_status, null: false, default: false

      t.timestamps
    end
  end
end
