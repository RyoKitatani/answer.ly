class Public::TagsController < ApplicationController

  def index
    @tags = Tag.all.order_by_questions
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
