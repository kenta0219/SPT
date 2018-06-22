class AdminsController < ApplicationController

	def top_ad
		@ngvideo = Ngvideo.all.pluck(:article_id).uniq
		@articles = Article.all
	end

	def show_ad
		
	end


	def edit_admin
		@admin = Admin.find(params[:id])
	end

	def admin_update
		@admin = Admin.find(params[:id])
		@admin.update(admin_params)
		redirect_to new_tag_path(current_admin.id)
	end

	def admin_delete
		
	end





	def new_tag
		@tag = Tag.new
		@tags = Tag.all
		@admins = Admin.all
	end

	def create_tag
		@tag = Tag.new(tag_params)
		@tag.save
		redirect_to new_tag_path
	end

	def update_tag

	end

	def delete_tag
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to new_tag_path
	end


	def destroy
		@article = Article.find(params[:id])
		Ngvideo.where(article_id: @article.id).delete_all
		@article.destroy
		redirect_to top_ad_path
	end






private
	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end