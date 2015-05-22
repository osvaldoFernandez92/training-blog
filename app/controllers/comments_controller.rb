# Clase comments controller
class CommentsController < ApplicationController
<<<<<<< HEAD
http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	  def create

    @comment = article.comments.create(comment_params)
=======
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
>>>>>>> RSpecs working in the blog. 6/6 specs succeeded. (Including model and controller specs)
    redirect_to article_path(@article)
  end

  def destroy
<<<<<<< HEAD
    @comment = article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
   end


  def article
    @article ||=  Article.find(params[:article_id])
=======
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
>>>>>>> RSpecs working in the blog. 6/6 specs succeeded. (Including model and controller specs)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
