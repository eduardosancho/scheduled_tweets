class OmniauthCallbacksController < ApplicationController
  def twitter
    # This cmd prints the entire response from the auth method
    # Rails.logger.info auth

    # auth.info only works if you have an elevated developer account https://developer.twitter.com/en/portal/products/elevated
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
    redirect_to root_path, notice: 'Successfully linked Twitter account.'
  end

  def auth
    request.env['omniauth.auth']
  end
end
