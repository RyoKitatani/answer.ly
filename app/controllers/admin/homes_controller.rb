class Admin::HomesController < ApplicationController
  def top
    @questions = Question.all
    @members = Member.all
  end
end
