class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user, only: [:show]
	
	def show
		
	end

	private
		def find_user
			@user = User.friendly.find(params[:id])
		end
end
