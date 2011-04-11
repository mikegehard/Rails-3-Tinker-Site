class ArticlesController < ApplicationController

  respond_to :html

  def index
    @articles = Article.all
    respond_with @articles
  end

  def new
    @article = Article.new
    respond_with @article
  end

  def create
    @article = Article.create(params[:article])
    respond_with @article do |format|
      format.html { redirect_to(articles_path) }
    end
  end

  def show
    @article = Article.find(params[:id])
    respond_with @article
  end
end
