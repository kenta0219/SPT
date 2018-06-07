class UsersController < ApplicationController
	def top_video
	end

	def new_video
		@video = Video.new
	end

	def index_video
		@videos = Video.all
	end

	def show_video
		@video = Video.find(params[:id])
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



	def mypage

	end

	# def edit_user
	# 	@user = User.find(params[:id])
	# end

	def create_user
	end

	def destroy_user
	end

	def update_user
	end
end

private

	def video_params
	  params.require(:video).permit(:video_name, :video_id)
	end

	def user_params
	  params.require(:user).permit(:name, :email, :image)
	end

