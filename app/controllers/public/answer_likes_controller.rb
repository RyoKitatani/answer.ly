class Public::AnswerLikesController < ApplicationController
  before_action :authenticate_member!

  def createcd answerly
    @answer = Answer.find(params[:answer_id])
    @answer_like = current_member.answer_likes.new(answer_id: @answer.id)
    @answer_like.save
    render :create
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @answer_like = current_member.answer_likes.find_by(answer_id: @answer.id)
    @answer_like.destroy
    render :destroy
  end

end
