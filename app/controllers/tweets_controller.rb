class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_twitter_account, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled successfully."
    else
      render :new
    end
  end
  
  def destroy
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "Successfully unlinked #{@twitter_account.username} account."
  end

  private
  
  def set_twitter_account
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end
end
