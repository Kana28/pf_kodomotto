class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @article = Article.new
    @articles = Article.all
  end

  def show
    @user = User.find(params[:id])
    # ページネート
    @articles = @user.articles.reverse_order.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
    redirect_to user_path(current_user.id) if current_user.id != @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '※ユーザ情報が変更されました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
