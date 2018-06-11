class AdminsController < ApplicationController

	def top_ad
	end

	def show_ad
		
	end

	def admin_ad
		@admins = Admin.all
	end

	def admin_edit
		@admin = Admin.find(params[:id])
	end

	def admin_update
		
	end

	def admin_delete
		
	end




	def tag_merger
		
	end

	def create_tag
		
	end

	def update_tag
		
	end

	def delete_tag
		
	end






private
	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end
end