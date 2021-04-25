class Admin::TagsController < ApplicationController
  before_action :admin_header_actions

  def index
    @tags = Tag.all
  end

  def index
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "タグを作成しました。"
      redirect_to request.referer
    else
      flash[:danger] = "タグの作成に失敗しました。"
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash.now[:success] = "内容を変更しました。"
      redirect_to admin_tags_path(@tag)
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      flash.now[:success] = "投稿を削除しました。"
      redirect_to request.referer
    else
      flash.now[:danger] = "削除に失敗しました。"
      @tag = Question.find(params[:id])
      @tags = Tag.all.order(created_at: :desc)
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
