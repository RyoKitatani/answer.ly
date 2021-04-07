class Answer < ApplicationRecord

  belongs_to :member
  belongs_to :question
  has_many   :answer_likes, dependent: :destroy

end
