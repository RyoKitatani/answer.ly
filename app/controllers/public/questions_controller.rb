class Public::QuestionsController < ApplicationController
  impressionist :actions=>[:show]
  layout "homes"
  before_action :authenticate_member!

  def show
    @members = Member.all
    @member = current_member
    @question = Question.find(params[:id])
    @tags = Tag.all.page(params[:page]).order(answers: :asc).per(5)
    @answer = Answer.new
    @response = Response.new
    impressionist(@question, nil, unique: [:session_hash.to_s])
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
      redirect_to question_path(@question)
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

  private

  def question_params
    params.require(:question).permit(:title, :content, :best_answer_id, tag_ids:[])
  end

end
