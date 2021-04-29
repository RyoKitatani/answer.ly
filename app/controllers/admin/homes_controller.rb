class Admin::HomesController < ApplicationController
  before_action :admin_header_actions

  def top
    @questions_all = Question.all.page(params[:page])
  end

end
