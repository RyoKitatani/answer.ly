class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @questions = Question.all.page(params[:page]).reverse_order
    @tags = Tag.all.page(params[:page]).order(answers: :asc).per(5)
    @members = Member.all.order(created_at: :asc)
  end

  def about
  end
end
