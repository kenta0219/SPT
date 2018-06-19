class PostCommentsController < ApplicationController


	def new
		@post_comment = PostComment.new
	end

	def create
		@article = Article.find(params[:article_id])
    	@post_comment = PostComment.new(post_comment_params)
    	@post_comment.article_id = @article.id
    	@post_comment.user_id = current_user.id
    	@post_comment.save
    	redirect_to index_video_path
	end

	def destroy
		@article = Article.find(params[:article_id])
		@post_comment = PostComment.find_by(article_id: @article.id, id: params[:id])
		@post_comment.destroy
		redirect_to show_video_path(@article)
	end


	private
		def post_comment_params
		  params.require(:post_comment).permit(:comment)
		end
end
