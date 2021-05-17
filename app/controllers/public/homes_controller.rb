class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @question_all = Question.includes([:member], [:tags], [:question_tags], [:answers]).order(created_at: :desc)
    @questions = Question.includes([:member], [:tags], [:question_tags], [:answers]).page(params[:page]).reverse_order.per(10)
    @members = Member.includes([:questions])
    @tags = Tag.includes([:questions]).page(params[:page]).order_by_questions.per(5)
    @member_all = Member.includes([:answers]).page(params[:page]).order_by_answers.per(5)
    @member_alls = Member.includes([:questions]).page(params[:page]).order_by_question.per(5)
  end

  def about
  end
end
