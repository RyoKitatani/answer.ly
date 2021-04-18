class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @questions = Question.all.page(params[:page]).reverse_order
    @answers = Answer.all
    @members = Member.all.order(created_at: :asc)
    @tags = Tag.all.page(params[:page]).order_by_questions.per(5)
  end

  def about
  end
end
