class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    p request.env['omniauth.auth']
    @user = User.find_for_twitter_oath(request.env['omniauth.auth'], current_user)
    if @user.persisted?
      flash[:notice] = 'Successfully connected to Twitter'
    else
      flash[:error] = 'Unable to connect to Twitter'
    end

    redirect_to root_path
  end

end