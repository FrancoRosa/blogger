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
    fsdf
    @article = Article.find(params[:article_id])

    @tag = Tag.new( tag_params )
    @tag.save

    @tagging = Tagging.new(@tag, @article)
    @tagging.save

    flash.notice = "Tag '#{@tag.name}' Created!"

    redirect_to tag_path(@tag)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
