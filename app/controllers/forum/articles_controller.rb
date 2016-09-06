require_dependency "forum/application_controller"

module Forum
  class ArticlesController < ApplicationController
    def new
      @article = Article.new
      authorize @article
      render 'form'
    end

    def create
      @article = Article.new params.require(:article).permit(:title, :body)
      authorize @article
      @article.user = current_user
      if @article.save
        redirect_to article_path(@article)
      else
        render 'form'
      end
    end

    def show
      @article = Article.find params[:id]
    end

    def edit
      @article = Article.find params[:id]
      authorize @article
      render 'form'
    end

    def update
      @article = Article.find params[:id]
      authorize @article
      if @article.update params.require(:article).permit(:title, :body)
        redirect_to article_path(@article)
      else
        render 'form'
      end
    end

    def destroy
      @article = Article.find params[:id]
      authorize @article
      @article.destroy
      redirect_to articles_path
    end

    def index
      @articles = Article.order(updated_at: :desc).page params[:page]
    end
  end
end
