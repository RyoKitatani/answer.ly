class Public::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def edit
  end

  def new
  end
end
