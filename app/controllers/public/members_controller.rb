class Public::MembersController < ApplicationController
   before_action :authenticate_member!, except:[:guest_sign_in, :index]

  def index
    @member_all = Member.all.order_by_answers
    @member_alls = Member.all.order_by_question
  end

  def show
    @member = Member.find(params[:id])

    @member_questions = @member.questions
    @question_likes_count = 0
    @member_questions.each do |question|
      @question_likes_count += question.question_likes.count
    end

    @member_answers = @member.answers
    @answer_likes_count = 0
    @member_answers.each do |answer|
      @answer_likes_count += answer.answer_likes.count
    end

    @total_likes = @question_likes_count + @answer_likes_count
  end

  def edit
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to request.referer
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "変更内容を保存しました。"
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def connections
    @member = Member.find(params[:id])
  end

  def withdraw
    @member = current_member
    @member.is_deleted = true
    if @member.save
      reset_session
      redirect_to root_path
    end
  end

  def guest_sign_in
    member = Member.find_or_create_by!(email:"guest@gmail.com") do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guestaccount"
    end
    sign_in member
    redirect_to root_path, noite: "ゲストユーザーとしてログインしました。"
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :image, :introduction, :country_code, :experienced_coutnry, :is_deleted)
  end

end