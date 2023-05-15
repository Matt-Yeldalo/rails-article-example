class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/:id
  def show
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

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article # redirect_to will cause the browser to make a new request
    else
      render :new, status: :unprocessable_entity # render renders the specified view for the current request
    end
  end

  # Renders articles/edit.html.erb
  def edit
    @article = Article.find(params[:id])
  end

  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to.update(article_params)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # Will be used to define the required params needed to create an article
  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
