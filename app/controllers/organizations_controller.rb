class OrganizationsController < ApplicationController
	before_action :find_organization, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :verify_owner!, only: [:edit, :update, :destroy]
	
	def index
		@organizations = Organization.all
	end

	def show
		
		
	end

	def new
		@organization = Organization.new
		
	end

	def create
		@organization = current_user.organizations.build(organization_params)
		@organization.owner = current_user
		@user = current_user
		@organization.users << current_user
		
		if @organization.save
			flash[:notice] = "Organization created successfully!"
			redirect_to @organization
		else
			flash[:alert] = "Organization was not created!"
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
		if @organization.update(organization_params)
			flash[:notice] = "Organization was updated successfully"
			redirect_to @organization
		else
			flash[:alert] = "Organization was not created!"
			render 'edit'
		end
	end

	def destroy
		@organization.destroy
		flash[:alert] = "Organization was deleted!"
		redirect_to organizations_url
	end




	private
		def find_organization
			@organization = Organization.find(params[:id])

			rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The page you requested does not exist"
			redirect_to organizations_path
		end

		def verify_owner!
			authenticate_user!

			unless @organization.owner == current_user
				flash[:alert] = "you do not have permission to #{action_name} this Organization"
				redirect_to organizations_path
			end
			
		end

		def organization_params
			params.require(:organization).permit(:name)
		end
end
