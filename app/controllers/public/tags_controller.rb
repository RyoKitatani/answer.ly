class Public::TagsController < ApplicationController

  def index
    @tags = Tag.all.order(created_at: :asc)
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
