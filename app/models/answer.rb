class Answer < ApplicationRecord

  belongs_to :member
  belongs_to :question
  has_many   :answer_likes, dependent: :destroy
  has_many   :responses, dependent: :destroy

  def answer_liked_by?(member)
    answer_likes.where(member_id: member.id).exists?
  end

  def self.a_ranking
    self.joins(:answer_likes, :member).group("members.id").select("count(answer_likes.answer_id) as cnt, members.*").order("cnt desc").limit(10)
  end

end


