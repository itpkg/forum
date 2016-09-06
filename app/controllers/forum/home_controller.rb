require_dependency "forum/application_controller"

module Forum
  class HomeController < ApplicationController
    def index
      @articles = Article.order(rate: :desc).limit(32)
      @article = @articles.first
    end

    def rate
      item = Object.const_get(params[:type]).find params[:id]
      unless item.nil?
        item.update_column :rate, item.rate+params[:score].to_i
      end
    end
  end
end
