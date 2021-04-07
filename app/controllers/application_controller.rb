class ApplicationController < ActionController::Base
  before_action :question_total

  def question_total
    @questions = Question.all
  end

end
