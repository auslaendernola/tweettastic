class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:destroy, :update, :show, :edit]
  def index
    @tweets = Tweet.all
  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html {redirect_to @tweet, notice: 'Tweet was successfully created!'}
      else
        format.html {render :new}
      end
    end
  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Your Tweet was updated'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "You're tweet has been destroyed"
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
