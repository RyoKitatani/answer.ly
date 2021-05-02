class WelcomeMailer < ApplicationMailer
  def welcome_email
    @member = params[:member]
    mail(to: @member.email, subject: 'Answer.lyのご登録ありがとうございます。')
  end
end
