class Public::AnswersController < ApplicationController

  def edit
    # @question = Question.find(params[:question_id])
    # @answer = Answer.find(params[:id])
  end

  def update
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = current_member.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.member_id = current_member.id
    if @answer.save
      flash[:notice] = "You have commented successfully"
      redirect_to request.referer
    else
      @question = Question.find(params[:id])
      @tags = Tag.all.order(created_at: :desc)
      render "questions/show"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find_by(id: params[:id], question_id: params[:question_id])
    @answer.destroy
    redirect_to request.referer
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
