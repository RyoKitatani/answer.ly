class CreateQuestionLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :question_likes do |t|

      t.timestamps
    end
  end
end
