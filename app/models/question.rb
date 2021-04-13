class Question < ApplicationRecord

  belongs_to :member
  has_many   :question_tags, dependent: :destroy
  has_many   :tags, through: :question_tags, dependent: :destroy
  has_many   :question_likes, dependent: :destroy
  has_many   :liked_members, through: :question_likes, source: :member
  has_many   :answers, dependent: :destroy

  def question_liked_by?(member)
    question_likes.where(member_id: member.id).exists?
  end

  def save_tag(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create
    new_tags.each do |new_name|
      question_tag = Tag.find_or_create_by(name:new_name)
      self.tags << question_tag
    end
  end


end