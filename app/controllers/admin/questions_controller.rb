class Admin::QuestionsController < ApplicationController
  before_action :admin_header_actions

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash.now[:success] = "投稿を削除しました。"
      redirect_to admin_path
    else
      flash.now[:danger] = "削除に失敗しました。"
      @question = Question.find(params[:id])
      render :show
    end
  end
end
