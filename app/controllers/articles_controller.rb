class ArticlesController < ApplicationController
 before_action :authenticate_user!

 	def index
    @articles = Article.all
  end

	def new
    @article = Article.new
	end

	def article
    @article ||= Article.find(params[:id])
  end

  def show
    article
  end

  def edit
    article
  end

	def create
  	@article = Article.new(article_params)
 		 if @article.save
  		redirect_to @article
    else
      render 'new'
	   end
  end

  def update
    article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article
    @article.destroy
    
    redirect_to articles_path
  end

 private
  	def article_params
    	params.require(:article).permit(:title, :text)
  	end
end
