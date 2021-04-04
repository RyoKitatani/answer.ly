class Question < ApplicationRecord

  has_many   :questions_tags
  has_many   :question_likes
  has_many   :answers
  belongs_to :member

end
