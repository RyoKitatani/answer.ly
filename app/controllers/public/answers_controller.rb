class Public::AnswersController < ApplicationController
  before_action :member_header_actions
  before_action :authenticate_member!

  def create
    @question = Question.find(params[:question_id])
    @answer = current_member.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.member_id = current_member.id
    if @answer.save
      flash[:success] = "回答しました。"
      redirect_to request.referer
    else
      @question = Question.find(params[:question_id])
      @tags = Tag.all.order(created_at: :desc)
      @response = Response.new
      flash[:danger] = "回答を入力してください"
      redirect_to question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find_by(id: params[:id], question_id: params[:question_id])
    @answer.destroy
    flash[:success] = "回答を削除しました。"
    redirect_to request.referer
  end

  def bestanswer
    @answer = Answer.find(params[:id])
    @answer.best_answer = true
    if @answer.save
      flash[:success] = "ベストアンサーを決定しました。"
      redirect_to request.referer
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
