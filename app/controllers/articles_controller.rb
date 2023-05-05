class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # Get an article by id
  def get_article_by_id
    @article = Article.find(params[:id])
  end

  # Create an article
  # New action instantiates a new article but does not save it
  # By default, the new action will render /articles/new.html.erb
  # Create action instatiates a new article with values and attempts to save it
  # Use redirect_to after mutating the database or application state, otherwise if the user refreshes, the browser will make the same request causing another mutation
  def new
    @article = Article.new
  end
  def create_article
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article # redirect_to will cause the browser to make a new request
    else
      render :new, status: :unprocessable_entity # render renders the specified view for the current request
    end
  end

end
