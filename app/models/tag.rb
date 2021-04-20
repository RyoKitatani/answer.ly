class Tag < ApplicationRecord

  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.order_by_questions
    Tag.select('tags.*', 'count(question_id) AS questions')
       .left_joins(:questions)
       .group('tags.id')
       .order('questions DESC')
  end

end
