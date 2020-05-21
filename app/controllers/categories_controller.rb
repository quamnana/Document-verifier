class CategoriesController < ApplicationController
	before_action :get_organization
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
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
			@organization = Organization.find(params[:organization_id])
		end

		def set_category
			@category = @organization.categories.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end
end