class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
  
    @comment.save
  
    redirect_to article_path(@comment.article)
  end
  
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    flash.notice = "Comment '#{@comment.body}' was succesfuly removed!"

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to article_path(@article)
  end
end
