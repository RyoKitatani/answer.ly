class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @question_all = Question.all.order(created_at: :desc)
    @questions = Question.all.page(params[:page]).reverse_order.per(10)
    @answers = Answer.all
    @members = Member.all
    @tags = Tag.all.page(params[:page]).order_by_questions.per(5)
    @member_all = Member.all.order_by_answers
    @member_alls = Member.all.page(params[:page]).order_by_question.per(5)
  end

  def about
  end

end
