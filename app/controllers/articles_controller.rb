class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def get_article_by_id
    @article = Article.find(params[:id])
  end
end
