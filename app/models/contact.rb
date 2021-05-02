class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true
  validates :email, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :message, presence: true, length: { maximum: 500 }
end
