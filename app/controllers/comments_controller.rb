# Clase comments controller
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def article
    @article = Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
