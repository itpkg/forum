require_dependency "forum/application_controller"

module Forum
  class HomeController < ApplicationController
    def index
      @articles = Article.order(rate: :desc).limit(32)
      @article = @articles.first
    end
  end
end
