class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
   	before_action :configure_permitted_parameters, if: :devise_controller?





	private
		# Permit other parameters that were added to Devise default parameters
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up) do |user|
				user.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
			end
			devise_parameter_sanitizer.permit(:account_update) do |user|
				user.permit(:first_name, :last_name, :username, :email, :password, :current_password, :password_confirmation)
			end
		end

		# Redirecting to organizations_path after user is signed in
		def after_sign_in_path_for(resource)
			"/organizations"
		end

end
