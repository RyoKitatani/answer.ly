class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def connections
  end

  def guest_sign_in
    member = Member.find_or_create_by!(email:"guest@gmail.com") do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲストユーザー"
    end
    sign_in member
    redirect_to root_path, noite: "ゲストユーザーとしてログインしました。"
  end

end
