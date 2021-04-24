class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def line
    callback_for(:line)
  end

  def twitter
    callback_for(:twitter)
  end

  def failure
    redirect_to root_path and return
  end


  private

  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = Member.find_oauth(@omniauth)
    @member = info[:member]

    if @member.persisted?
      sign_in_and_redirect @member, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      @sns = info[:sns]
      session[:provider] = @sns[:provider]
      session[:uid] = @sns[:uid]
      render template: "members/registrations/new"
    end
  end

end
