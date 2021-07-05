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

    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was successfully created."
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tweet
      @tweet = Post.find(params[:id])
    end

    def tweet_params
      params.require(:post).permit(:content)
    end
end
