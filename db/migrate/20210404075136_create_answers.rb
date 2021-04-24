class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true, null: false, default: ""
      t.references :member, foreign_key: true, null: false, default: ""
      t.text       :content, null: false, default: ""

      t.timestamps
    end
  end
end
