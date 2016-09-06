require_dependency "forum/application_controller"

module Forum
  class CommentsController < ApplicationController

    def new
      @comment = Comment.new
      @comment.article_id = params[:article_id]
      render 'form'
    end

    def create
      @comment = Comment.new params.require(:comment).permit(:body, :article_id)
      @comment.user = current_user
      authorize @comment
      if @comment.save
        redirect_to article_path(@comment.article_id)
      else
        render 'form'
      end
    end

    def edit
      @comment = Comment.find params[:id]
      authorize @comment
      render 'form'
    end

    def update
      @comment = Comment.find params[:id]
      authorize @comment
      if @comment.update params.require(:comment).permit(:body)
        redirect_to article_path(@comment.article_id)
      else
        render 'form'
      end
    end

    def destroy
      @comment = Comment.find params[:id]
      authorize @comment
      @comment.destroy
      redirect_to article_path(@comment.article_id)
    end


    def index
      @comments = Comment.order(updated_at: :desc).page params[:page]
    end
  end
end
