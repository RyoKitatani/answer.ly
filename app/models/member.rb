class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

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

  VALID_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :name, format: { with: VALID_REGEX }, presence: true, uniqueness: true, length:{ maximum: 20, minimum: 3}
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
    return { member: member ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    member = Member.where(id: snscredential.member_id).first
    unless member.present?
        member = Member.new(name: auth.info.name,email: auth.info.email)
    end
    return {member: member}
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
    return { member: member ,sns: sns}
  end

  def total_likes(member)
    question_likes_count = 0
    member.questions.each do |question|
      question_likes_count += question.question_likes.count
    end

    answer_likes_count = 0
    member.answers.each do |answer|
      answer_likes_count += answer.answer_likes.count
    end
    question_likes_count + answer_likes_count
  end

  def self.order_by_answers
    Member.select('members.*', 'count(member_id) AS answers')
       .left_joins(:answers)
       .group('members.id')
       .order('answers DESC')
  end

  def self.order_by_question
    Member.select('members.*', 'count(member_id) AS questions')
       .left_joins(:questions)
       .group('members.id')
       .order('questions DESC')
  end

end