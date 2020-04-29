class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end
  
  def index
    @tags = Tag.all
  end

  def destroy
    @tagging = Tagging.find(params[:id])
    @tagging.destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Deleted! tagging:#{@tagging.id}, tag:#{@tag.id}"
    redirect_to tags_path
  end

  def new
    @tag = Tag.new
  end

  def create
    @tagging = Tagging.new( 
      tag_id: params[:id], 
      article_id: params[:article_id] 
    )
    @tagging.save
    
    @tag = Tag.new( tag_params )
    @tag.save

    @article = Article.find(id: params[:article_id])
    @article.tag_list = @article.tag_list << @tag.name 

    flash.notice = "Tag '#{@tag.name}' Created!"

    redirect_to tag_path(@tag)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
