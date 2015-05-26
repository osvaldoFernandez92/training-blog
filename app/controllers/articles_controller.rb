# clase ArticlesController
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user=current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def send_last_articles
    ArticleMailer.email_last_articles(current_user,10).deliver
    flash[:notice] = "Articles have been sent."
    redirect_to root_path
  end

  def send_last_users_articles
    respond_to :js
    HardWorker.perform_async(current_user.email,5,10)
  end 

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
