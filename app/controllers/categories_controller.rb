class CategoriesController < ApplicationController
	before_action :get_organization
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :verify_owner!, only: [:edit, :update, :destroy]

	def index
		@categories = @organization.categories
	end

	def show
		
	end

	def new
		@category = @organization.categories.build
	end

	def create
		@category = @organization.categories.build(category_params)

		if @category.save
			flash[:notice] = "Your was category was created successfully"
			redirect_to organization_path(@organization)
		else
			flash[:alert] = "Your category was not created"
			render 'new'
		end 
	end

	def edit
		
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Your category was updated successfully"
			redirect_to organization_category_path(@organization)
		else
			flash[:alert] = "Your category was not updated"
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		flash[:alert] = "Your category was deleted successfully!"
		redirect_to organization_path(@organization)
	end



	private
		def get_organization
			@organization = Organization.friendly.find(params[:organization_id])
		end

		def set_category
			@category = @organization.categories.friendly.find(params[:id])

			# Rescue page if the page ID is not found
			rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The page you requested does not exist"
			redirect_to organization_path(@organization)
		end

		def category_params
			params.require(:category).permit(:name)
		end

		# Verify if the current user is the owner or admin of the organization before giving permission to perform actions stated above
		def verify_owner!
			authenticate_user!

			unless (@organization.owner == current_user) 
				flash[:alert] = "you do not have permission to #{action_name} this Category"
				redirect_to organization_path(@organization)
			end
			
		end
end