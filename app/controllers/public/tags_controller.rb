class Public::TagsController < ApplicationController
  before_action :authenticate_member!, except:[:index]

  def index
    @tags = Tag.all.order_by_questions
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
