class CommentsController < ApplicationController
  def index
     @article = Article.find(params[:article_id])
     @comments = @article.comments
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    # @article = Article.find(params[:task_id])
    # @comment = @article.comments.new(comment_params)

    # if @comment.save
    #   flash[:success] = 'Comment successfully created.'
    #   redirect_to article_comment_path(@comment)
    # else
    #   render :new
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
