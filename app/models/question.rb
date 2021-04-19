class Question < ApplicationRecord
  is_impressionable

  belongs_to :member
  has_many   :question_tags, dependent: :destroy
  has_many   :tags, through: :question_tags, dependent: :destroy
  has_many   :question_likes, dependent: :destroy
  has_many   :liked_members, through: :question_likes, source: :member
  has_many   :answers, dependent: :destroy

  def question_liked_by?(member)
    question_likes.where(member_id: member.id).exists?
  end

  def self.ranking
    self.joins(:question_likes, :member,).group("members.id").select("count(question_likes.question_id) as cnt, members.*").order("cnt desc").limit(10)
  end

end