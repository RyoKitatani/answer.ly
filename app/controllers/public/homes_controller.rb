class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @members = Member.all.order(created_at: :asc)
    @questions = Question.all.page(params[:page]).reverse_order
    @tags = Tag.all.page(params[:page]).order(answers: :asc).per(8)
  end

  def about
  end
end
