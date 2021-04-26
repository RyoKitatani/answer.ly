class Public::AnswersController < ApplicationController
  before_action :member_header_actions
  before_action :authenticate_member!
  layout 'homes'

  def create
    @question = Question.find(params[:question_id])
    @answer = current_member.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.member_id = current_member.id
    if @answer.save
      flash[:success] = "#{@question.title}に回答しました。"
      redirect_to request.referer
    else
      @question = Question.find(params[:question_id])
      @tags = Tag.all.order(created_at: :desc)
      @response = Response.new
      render "public/questions/show"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find_by(id: params[:id], question_id: params[:question_id])
    @answer.destroy
    flash[:success] = "#{@question.title}の回答を削除しました。"
    redirect_to request.referer
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
