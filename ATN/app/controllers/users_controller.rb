class UsersController < ApplicationController



	# confirm_video
	def confirm_video
		@video = Video.new(video_params)
		@video.save
		redirect_to new_video_path
	end




	# mypage
	def mypage
	end

	def edit_user
		@user = User.find(params[:id])
		@articles = current_user.articles.all
	end

	def create_user
		@user = User.find(params[:id])
		@user.save
		redirect_to user_mypage_path(current_user.id)
	end

	def update_user
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_mypage_path(current_user.id)
	end

	def delete_user
	end


	def delete_article
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to edit_user_path(current_user.id)
	end

private

	def tag_params
		params.require(:tag).permit(:tag_name)
	end

end

