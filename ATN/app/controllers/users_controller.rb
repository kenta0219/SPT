class UsersController < ApplicationController



	# mypage
	def mypage
		@articles = current_user.articles.all.reverse
	end

	def edit_user
		@user = User.find(params[:id])
	end

	def create_user
		@user = User.find(params[:id])
		@user.save
		redirect_to user_mypage_path(current_user.id)
	end

	def update_user
		@user = User.find(params[:id])
		if 	@user.update(user_params)
			flash[:notice_user] = "編集完了"
			redirect_to user_mypage_path(current_user.id)
		else
			render 'edit_user'
		end
	end

	def delete_user
		@user = User.find(params[:id])
		@user.destroy
		redirect_to top_video_path
	end


	def delete_article
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to mypage_path(current_user.id)
	end

private

	def tag_params
		params.require(:tag).permit(:tag_name)
	end

	def user_params
		params.require(:user).permit(:image, :name, :email, :password)
	end

end

