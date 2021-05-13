class Answer < ApplicationRecord
  belongs_to :member
  belongs_to :question
  has_many   :answer_likes, dependent: :destroy
  has_many   :responses, dependent: :destroy
  has_many   :notifications, dependent: :destroy

  # attachment :image

  validates :content, presence: true

  def answer_liked_by?(member)
    answer_likes.where(member_id: member.id).exists?
  end

  def self.a_ranking
    joins(:answer_likes, :member).group("members.id").select("count(answer_likes.answer_id) as cnt, members.*").order("cnt desc").limit(10)
  end

  def create_notification_like(current_member)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and answer_id = ? and action = ? ", current_member.id, member_id, id, 'answer_like'])
    if temp.blank?
      notification = current_member.active_notifications.new(
        answer_id: id,
        visited_id: member_id,
        action: 'answer_like'
      )
      notification.save if notification.valid?
    end
  end

  def create_notification_response!(current_member, response_id)
    save_notification_response!(current_member, response_id, member_id)
  end

  def save_notification_response!(current_member, response_id, visited_id)
    notification = current_member.active_notifications.new(
      answer_id: id,
      response_id: response_id,
      visited_id: visited_id,
      action: 'response'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
