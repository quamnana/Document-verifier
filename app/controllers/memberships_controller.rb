class MembershipsController < ApplicationController
	before_action :find_organization, only: [:create]
	before_action :authenticate_user!
	
	# Giving membership right of an organization to the current user by passing the current user's ID
	def create
		@membership = @organization.memberships.where(user: current_user).first_or_create

		if @membership.save
			flash[:notice] = "You have successfully joined this Organization"
			redirect_to organization_path(@organization)	
		end
	end

	private
		def find_organization
			@organization = Organization.friendly.find(params[:organization_id])
		end
end
