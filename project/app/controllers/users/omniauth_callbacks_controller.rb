class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_url
    end
  end

  def setup
    request.env['omniauth.strategy'].options[:client_id] = @site.facebook_id
    request.env['omniauth.strategy'].options[:client_secret] = @site.facebook_key
    render :text => "Setup complete.", :status => 404
  end

  def failure
    redirect_to root_path
  end
end