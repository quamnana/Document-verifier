class TemplatesController < ApplicationController
	before_action :get_organization
	before_action :set_template, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :verify_owner!, only: [:edit, :update, :destroy]

	def index
		@templates = @organization.templates.order(created_at: :DESC)
	end

	def show
		
	end

	def new
		@template = @organization.templates.build
	end

	def create
		@template = @organization.templates.build(template_params)
		@template.user = current_user

		if @template.save
			flash[:notice] = "Your template was created successfully!"
			redirect_to organization_path(@organization)
		else
			flash[:alert] = "Your template was not created"
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
		if @template.update(template_params)
			flash[:notice] = "Your template has been updated"
			redirect_to organization_template_path(@organization)
		else
			flash[:alert] = "Your template has not been updated"
			render 'edit'
		end
	end

	def destroy
		@template.destroy
		flash[:alert] = "Your template was deleted successfully"
		redirect_to organization_path(@organization)
	end





	private
		def get_organization
			@organization = Organization.friendly.find(params[:organization_id])
		end

		def set_template
			@template = @organization.templates.friendly.find(params[:id])

			# Rescue page if the page ID is not found
			rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The page you requested does not exist"
			redirect_to organization_path(@organization)
		end

		def template_params
			params.require(:template).permit(:name, :body, :organization_id, :category_id)
		end

		# Verify if the current user is the owner or admin of the organization or template before giving permission to perform actions stated above
		def verify_owner!
			authenticate_user!

			unless (@organization.owner == current_user || @template.user == current_user ) 
				flash[:alert] = "you do not have permission to #{action_name} this Template"
				redirect_to organization_path(@organization)
			end
			
		end
end

