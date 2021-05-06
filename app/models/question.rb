class Question < ApplicationRecord
  is_impressionable

  belongs_to :member
  has_many   :question_tags, dependent: :destroy
  has_many   :tags, through: :question_tags, dependent: :destroy
  has_many   :question_likes, dependent: :destroy
  has_many   :liked_members, through: :question_likes, source: :member
  has_many   :answers, dependent: :destroy
  has_many   :notifications, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { minimum: 5, maximum: 50 }, allow_blank: true
  validates :content, presence: true
  validates :content, length: { minimum: 20 }, allow_blank: true

  def question_liked_by?(member)
    question_likes.where(member_id: member.id).exists?
  end

  def self.ranking
    joins(:question_likes, :member,).group("members.id").select("count(question_likes.question_id) as cnt, members.*").order("cnt desc").limit(10)
  end

  # notifications

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

  def create_notification_comment!(current_member, answer_id)
    temp_ids = Answer.select(:member_id).where(question_id: id).where.not(member_id: current_member.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_member, answer_id, temp_id['member_id'])
    end
    save_notification_comment!(current_member, answer_id, member_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_member, answer_id, visited_id)
    notification = current_member.active_notifications.new(
      question_id: id,
      answer_id: answer_id,
      visited_id: visited_id,
      action: 'answer'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
