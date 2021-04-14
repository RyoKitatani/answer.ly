class Public::QuestionsController < ApplicationController
  layout "homes"
  before_action :authenticate_member!

  def show
    @members = Member.all
    @member = current_member
    @question = Question.find(params[:id])
    @tags = Tag.all.order(created_at: :desc)
    @answer = Answer.new
    @response = Response.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.member_id = current_member.id
    if @question.save
      flash.now[:success] = "質問を投稿しました。"
      redirect_to question_path(@question)
    else
      flash.now[:danger] = "質問の投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    if @question.member != current_member
      redirect_to request.referer
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash.now[:success] = "内容を変更しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.member = current_member
    if @question.destroy
      flash.now[:success] = "投稿を削除しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "削除に失敗しました。"
      @question = Question.find(params[:id])
      @tags = Tag.all.order(created_at: :desc)
      render :show
    end
  end

  def best_answer
    @question = Question.find(params[:id])
    @answer = @question.answer.best_answer = true
    if @answer.save
       @question.question_status = true
       @question.save
       flash[:success] = "ベストアンサーを決定しました。"
    else
       flash[:danger] = "ベストアンサーの選択に失敗しました。"
       @members = Member.all
       @member = current_member
       @question = Question.find(params[:id])
       @tags = Tag.all.order(created_at: :desc)
       @answer = Answer.new
       @response = Response.new
       render　show
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, tag_ids: [])
  end

end
