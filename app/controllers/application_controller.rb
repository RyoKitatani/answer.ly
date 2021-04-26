class ApplicationController < ActionController::Base
  before_action :question_total
  before_action :authenticate_admin!, if: :admin_url
  before_action :member_header_actions

  def admin_url
    request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Member
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      root_path
    else
      root_path
    end
  end

  def question_total
    @question_all = Question.all
  end

  def admin_header_actions
    @questions = Question.all
    @members = Member.all
    @tag_all = Tag.all.order_by_questions
    @contacts = Contact.all
  end

  def member_header_actions
    @questions = Question.all
    @members = Member.all.order(created_at: :desc)
    @tags = Tag.all
    @member_all = Member.all.order_by_answers
    @member_alls = Member.all.page(params[:page]).order_by_question.per(5)
  end
end
