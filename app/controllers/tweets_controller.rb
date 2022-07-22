class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_twitter_account, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end
  
  def destroy
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "Successfully unlinked #{@twitter_account.username} account."
  end

  private
  
  def set_twitter_account
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
  end
end
