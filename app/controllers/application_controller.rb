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
      new_admin_session_path
    else
      new_member_session_path
    end
  end

  def question_total
    @question_all = Question.all
  end

  def admin_header_actions
    @questions = Question.all
    @members = Member.all
    @tags = Tag.all
  end

  def member_header_actions
    @questions = Question.all
    @members = Member.all.order(created_at: :desc)
    @tags = Tag.all
  end

end
