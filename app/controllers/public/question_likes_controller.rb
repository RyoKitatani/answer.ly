class Public::QuestionLikesController < ApplicationController
  before_action :authenticate_member!

  def create
    @question = Question.find(params[:question_id])
    @question_like = current_member.question_likes.new(question_id: @question.id)
    @question_like.save
    render :create
  end

  def destroy
    @question = Question.find(params[:question_id])
    @question_like = current_member.question_likes.find_by(question_id: @question.id)
    @question_like.destroy
    render :destroy
  end

end
