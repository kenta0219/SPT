class UsersController < ApplicationController


	# video
	def show_video
		@video = Video.find(params[:id])
		@user = User.find_by(id: @video.user_id)
	end

	# def edit_item
	# 	@item = Item.find(params[:id])
	# end

	def create_video
		@video = Video.new(video_params)
		@video.save
		redirect_to index_video_path
	end

	def update_video
	end

	def delete_video
	end

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

private

	def video_params
	  params.require(:video).permit(:video_name, :video_information, :video_id, :user_id)
	end

	def user_params
	  params.require(:user).permit(:name, :email, :image, :password, :favorite_sports)
	end

	def tag_params
		params.require(:tag).permit(:tag_name)
	end

end

