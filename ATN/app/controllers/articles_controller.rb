class ArticlesController < ApplicationController

  def top_video
      @articles = Article.all.reverse
  end



  def index_video
    @article = Article.all

    if params[:tag_id] == "tag" then
      @article = @article.where(tag: params[:tag_id])
    end

    @articles = @article.page(params[:page]).reverse_order
    @tags = Tag.all
  end


  def show_video
    @article = Article.find(params[:id])
    @ngvideo = Ngvideo.new
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
    if  @article.destroy
        flash[:notice] = '削除完了'
        redirect_to user_mypage_path(current_user.id)
    else
      render 'user_mypage'
    end
  end

  def article_add
    @ngvideo = Ngvideo.new(ngvideo_params)
    @ngvideo.user_id = current_user.id
    if   @ngvideo.save
        flash[:notice] = '通報完了'
        redirect_to top_video_path
    else
      render 'show_video'
    end
  end



  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :video, :video_information, :tag_id, :user_id)
    end

    def ngvideo_params
      params.require(:ngvideo).permit(:article_id)
    end

end
