class ArticlesController < ApplicationController

  def index
    @article = Article.new
    @articles = Article.page(params[:page]).per(4)
    @users = User.all
  end

  def show
    @article = Article.find(params[:id])
    @users = User.all
    
    @article_comment = ArticleComment.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
      redirect_to article_path(article.id)
    else
      render :index
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article)
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:user_id, :genre_id, :title, :body, :user_image)
  end
end
