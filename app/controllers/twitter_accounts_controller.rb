class TwitterAccountsController < ApplicationController
  def index
    @twitter_accounts = Current.user.twitter_accounts
  end
  
  def destroy
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "Successfully unlinked #{@twitter_account.username} account."
  end
end
