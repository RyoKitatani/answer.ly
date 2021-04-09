class Answer < ApplicationRecord

  belongs_to :member
  belongs_to :question
  has_many   :answer_likes, dependent: :destroy
  has_many   :responses, dependent: :destroy
  
  def answer_liked_by?(member)
    answer_likes.where(member_id: member.id).exists?
  end
  
end
