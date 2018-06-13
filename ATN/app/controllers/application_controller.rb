class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cache_headers

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	def ensure_correct_user
	    @post = Post.find_by(id:params[:id])
	    if @post.user_id != @current_user.id
	      flash[:notice] = "権限がありません"
	      redirect_to("/posts/index")
	    end
	end


	def after_sign_in_path_for(resource)
		case resource
		when Admin
			top_ad_path
		when User
			top_video_path
		end
	end
	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :admin
			top_ad_path
		else
			top_video_path
		end
	end

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password])
			devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :password])
			devise_parameter_sanitizer.permit(:edit, keys:[:name, :email, :password])
		end

		def set_cache_headers
		  	response.headers["Cache_Control"] = "no-cache, no-store, max-age=0, must-revalidate"
		  	response.headers["Pragma"] = "no-cache"
		  	response.headers["Expires"] = '-1'
	  	end
end