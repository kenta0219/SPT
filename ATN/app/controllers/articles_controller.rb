class ArticlesController < ApplicationController

  def top_video
      @articles = Article.all.reverse
  end



  def index_video
    @articles = Article.page(params[:page]).reverse_order
    @tags = Tag.all
  end


  def show_video
    @article = Article.find(params[:id])
    @post_comment = PostComment.new
  end


  def new_video
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    logger.debug @article.errors.inspect
    redirect_to index_video_path
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_mypage_path(current_user.id)
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :video, :video_information, :tag_id, :user_id)
    end


end
