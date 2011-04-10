class ArticleTagsController < ApplicationController
  respond_to :html
  def index
    @tags = Article.find(params[:article_id]).tags
  end
  
  def new
  end

  def create
    @article = Article.find(params[:article_id])
    @tag = Tag.find_or_initialize_by_name(params[:tag][:name])
    @article_tag = ArticleTag.new(:article => @article, :tag => @tag)
    if @article_tag.save
      redirect_to article_tags_path
    else
      render "new"
    end

  end
end