class Admin::MembersController < ApplicationController
  before_action :admin_header_actions

  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "変更内容を保存しました。"
      redirect_to admin_member_path(@member)
    else
      render :edit
    end
  end

  def connection
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :image, :introduction, :country_code, :experienced_coutnry, :is_deleted)
  end
end
