class Public::QuestionLikesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @question_like = current_member.question_likes.new(question_id: @question.id)
    @question_like.save
    redirect_to request.referer
  end

  def destroy
    @question = Question.find(params[:question_id])
    @question_like = current_member.question_likes.find_by(question_id: @question.id)
    @question_like.destroy
    redirect_to request.referer
  end

end
