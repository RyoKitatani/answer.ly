class Public::HomesController < ApplicationController
  layout "homes"

  def top
    @members = Member.all.order(created_at: :desc)
    @questions = Question.all.order(created_at: :desc)
    # @question = Question.find(params[:id])
    @tags = Tag.all.order(created_at: :desc)
  end

  def about
  end
end
