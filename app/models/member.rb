class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, dependent: :destroy
  has_many :question_likes, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_member, through: :follower, source: :followed
  has_many :follower_member, through: :followed, source: :follower

  validates :name, presence: true
  validates :email, presence: true

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

end

