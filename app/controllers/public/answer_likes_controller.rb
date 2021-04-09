class Public::AnswerLikesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    @answer_like = current_member.answer_likes.new(answer_id: @answer.id)
    @answer_like.save
    redirect_to request.referer
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @answer_like = current_member.answer_likes.find_by(answer_id: @answer.id)
    @answer_like.destroy
    redirect_to request.referer
  end

end
