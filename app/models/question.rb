class Question < ApplicationRecord

  has_many   :question_tags, dependent: :destroy
  has_many   :tags, through: :question_tags, dependent: :destroy
  has_many   :question_likes, dependent: :destroy
  has_many   :answers, dependent: :destroy
  belongs_to :member

end
