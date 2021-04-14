class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @questions = Question.all.page(params[:page]).reverse_order
    @members = Member.all.order(created_at: :asc)
    @tags = Tag.all.page(params[:page]).order(answers: :asc).per(8)

  end

  def about
  end
end
