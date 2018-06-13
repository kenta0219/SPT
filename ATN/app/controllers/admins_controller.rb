class AdminsController < ApplicationController

	def top_ad
	end

	def show_ad
		
	end

	def admin_ad
		@admins = Admin.all
	end

	def edit_admin
		@admin = Admin.find(params[:id])
	end

	def admin_update
		@admin = Admin.find(params[:id])
		@admin.update(admin_params)
		redirect_to admin_ad_path(current_admin.id)
	end

	def admin_delete
		
	end




	def index_tag
		@tags = Tag.all
	end

	def new_tag
		@tag = Tag.new
	end

	def create_tag
		@tag = Tag.new(tag_params)
		@tag.save
		redirect_to index_tag_path
	end

	def update_tag

	end

	def delete_tag
		
	end






private
	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end