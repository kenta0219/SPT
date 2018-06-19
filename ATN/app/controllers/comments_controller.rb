class CommentsController < ApplicationController


	def create
		@article = Article.find(params[:article])
    	@post_comment = @article.post_comments.create(params[:comment])
    	redirect_to show_video_path(params[:article])
	end

	def destroy
		PostComment.destroy(params[:id])
		redirect_to page_path(params[:article])
	end


	private
		def post_comment_params
		  params.require(:post_comment).permit(:user_id, :post_image_id, :post_comment)
		end
end
