class Answer < ApplicationRecord

  belongs_to :member
  belongs_to :question

end
