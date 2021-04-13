class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @members = Member.all.order(created_at: :asc)
    @questions = Question.all.page(params[:page]).reverse_order
    @tags = Tag.all.order(created_at: :asc)
  end

  def about
  end
end
