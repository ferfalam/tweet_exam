class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def index
    @tweets = Post.all
  end

  def show
  end

  def new
    @tweet = Post.new
  end

  def edit
  end

  def create
    @tweet = Post.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "Tweet was successfully created."
      else
        render :new
      end
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was successfully updated."
    else
      render :edit
    end
  end

  def confirm
    @tweet = Post.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was successfully destroyed."
  end

  private
    def set_tweet
      @tweet = Post.find(params[:id])
    end

    def tweet_params
      params.require(:post).permit(:content)
    end
end
