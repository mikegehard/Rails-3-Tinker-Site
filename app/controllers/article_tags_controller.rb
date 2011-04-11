class ArticleTagsController < ApplicationController
  respond_to :html
  def index
    @tags = Article.find(params[:article_id]).tags
  end
  
  def new
  end

  def create
    @article_tag_creator = ArticleTagCreator.new(params[:article_id],params[:tag][:name])
    if @article_tag_creator.save
      redirect_to article_tags_path
    else
      render "new"
    end

  end
end