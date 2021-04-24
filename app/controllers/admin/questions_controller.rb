class Admin::QuestionsController < ApplicationController
  before_action :admin_header_actions

  def show
    @question = Question.find(params[:id])
  end

end
