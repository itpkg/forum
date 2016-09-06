require_dependency "forum/application_controller"

module Forum
  class TagsController < ApplicationController

    def new
      @tag = Tag.new
      authorize @tag
      render 'form'
    end

    def create
      @tag = Tag.new params.require(:tag).permit(:name)
      authorize @tag
      if @tag.save
        redirect_to tags_path
      else
        render 'form'
      end
    end

    def show
      @tag = Tag.find params[:id]
    end

    def edit
      @tag = Tag.find params[:id]
      render 'form'
    end

    def update
      @tag = Tag.find params[:id]
      authorize @tag
      if @tag.update params.require(:tag).permit(:name)
        redirect_to tags_path
      else
        render 'form'
      end
    end

    def destroy
      @tag = Tag.find params[:id]
      authorize @tag
      @tag.destroy
      redirect_to tags_path
    end
  end
end
