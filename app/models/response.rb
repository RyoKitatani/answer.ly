class Response < ApplicationRecord
  belongs_to :answer
  belongs_to :member
  has_many   :notifications, dependent: :destroy

  validates :content, presence: true
  

end
