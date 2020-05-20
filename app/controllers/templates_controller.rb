class TemplatesController < ApplicationController
	before_action :get_organization
	before_action :set_template, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@templates = @organization.templates
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
			redirect_to root_path
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
		redirect_to organization_template_path(@organization)
	end





	private
		def get_organization
			@organization = Organization.find(params[:organization_id])
		end

		def set_template
			@template = @organization.templates.find(params[:id])
		end

		def template_params
			params.require(:template).permit(:name, :body, :organization_id)
		end
end

