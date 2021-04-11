class ApplicationController < ActionController::Base
  before_action :question_total

  def question_total
    @question_all = Question.all
  end

end
