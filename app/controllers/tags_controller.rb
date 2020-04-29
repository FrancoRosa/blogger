class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end
  
  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag.title}' Deleted!"
    redirect_to tags_path
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new( tag_params )
    @tag.save
    flash.notice = "Tag '#{@tag.name}' Created!"
    redirect_to tag_path(@tag)
  end
  
  def edit
  end

end
