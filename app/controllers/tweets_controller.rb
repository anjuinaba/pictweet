class TweetsController < ApplicationController

# before_action :move_to_index, except: :index

  def index
   @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)

  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id ==current_user.id
end
def edit
  @tweet =Tweet.find(params[:id])

def update
      tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id ==current_user.id
      end
    end

    def show
      @tweet = Tweet.find(params[:id])
      @comment = @tweet.comments.includes(:user)
      # ビューの表示時にコメントとユーザーのデータを取得するためn+1問題が発生してしまっているためのincludeメソッド
      end

  private
  def tweet_params
    params.permit(:image, :text)
  end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end
end