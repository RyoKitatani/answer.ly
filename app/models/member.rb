class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,:confirmable

  has_many :questions, dependent: :destroy
  has_many :question_likes, dependent: :destroy
  has_many :liked_questions, through: :question_likes, source: :question
  has_many :answers, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_member, through: :follower, source: :followed
  has_many :follower_member, through: :followed, source: :follower
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  VALID_REGEX = /\A[\w@-]*[A-Za-z][\w@-]*\z/.freeze
  validates :name, format: { with: VALID_REGEX }, length: { maximum: 20, minimum: 3 }, allow_blank: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  attachment :image

  def follow(member_id)
    follower.create(followed_id: member_id)
  end

  def unfollow(member_id)
    follower.find_by(followed_id: member_id).destroy
  end

  def following?(member)
    following_member.include?(member)
  end

  #carmen-rails用 国コードを正式名称に変換
  def country
    Carmen::Country.coded(country_code)
  end

  def self.without_sns_data(auth)
    member = Member.where(email: auth.info.email).first
    if member.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        member_id: member.id,
      )
    else
      member = Member.new(
        name: auth.info.name,
        email: auth.info.email,
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider,
      )
    end
    { member: member, sns: sns }
  end

  def self.with_sns_data(auth, snscredential)
    member = Member.where(id: snscredential.member_id).first
    if member.blank?
      member = Member.new(name: auth.info.name, email: auth.info.email)
    end
    { member: member }
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      member = with_sns_data(auth, snscredential)[:member]
      sns = snscredential
    else
      member = without_sns_data(auth)[:member]
      sns = without_sns_data(auth)[:sns]
    end
    { member: member, sns: sns }
  end

  def total_likes(member)
    question_likes_count = 0
    member.questions.each do |question|
      question_likes_count += question.question_likes.size
    end

    answer_likes_count = 0
    member.answers.each do |answer|
      answer_likes_count += answer.answer_likes.size
    end
    question_likes_count + answer_likes_count
  end

  # 回答数が多いユーザー順に並べる
  def self.order_by_answers
    Member.select('members.*', 'count(member_id) AS answers').
      left_joins(:answers).
      group('members.id').
      order('answers DESC')
  end

  # 質問数が多いユーザー順に並べる
  def self.order_by_question
    Member.select('members.*', 'count(member_id) AS questions').
      left_joins(:questions).
      group('members.id').
      order('questions DESC')
  end

  # notification
  def create_notification_follow!(current_member)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_member.id, id, 'follow'])
    if temp.blank?
      notification = current_member.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
