class Public::QuestionsController < ApplicationController
  layout "homes"

  def show
    @
    @question = Question.find(params[:id])
    @tags = Tag.all.order(created_at: :desc)
  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.find(question_params)
    @question.member_id = current_member.id
    if @question.save
      flash[:success] = "質問を投稿しました。"
      redirect_to question_path(@question)
    else
      flash[:danger] = "質問の投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    if @question.member_id != current_member.id
      redirect_to request.referer
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "内容を変更しました。"
      redirect_to root_path
    else
      flash[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.member_id = current_member.id
    if @question.destory
      flash[:success] = "投稿を削除しました。"
      redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
