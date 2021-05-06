class Answer < ApplicationRecord
  belongs_to :member
  belongs_to :question
  has_many   :answer_likes, dependent: :destroy
  has_many   :responses, dependent: :destroy
  has_many   :notifications, dependent: :destroy

  validates :content, presence: true

  def answer_liked_by?(member)
    answer_likes.where(member_id: member.id).exists?
  end

  def self.a_ranking
    joins(:answer_likes, :member).group("members.id").select("count(answer_likes.answer_id) as cnt, members.*").order("cnt desc").limit(10)
  end

  def create_notification_by(current_member)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and question_id = ? and action = ? ", current_member.id, member_id, id, 'like'])
    if temp.blank?
      notification = current_member.active_notifications.new(
        question_id: id,
        visited_id: member_id,
        action: 'question_like'
        
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
    
    
    
    
  end

end
