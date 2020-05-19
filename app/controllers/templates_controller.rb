class TemplatesController < ApplicationController
before_action :find_template, only: [:show, :edit, :update, :destroy]

	def index
		@templates = Template.all
	end

	def show
		
	end

	def new
		@template = Template.new
	end

	def create
		@template = Template.new(template_params)

		if @template.save
			flash[:notice] = "Success"
			redirect_to @template
		else
			flash[:alert] = "Failure"
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @template.update(template_params)
			flash[:notice] = "Success"
			redirect_to @template
		else
			flash[:alert] = "Failure"
			render 'edit'
		end
	end

	def destroy
		@template.destroy
		flash[:alert] = "Deleted"
		redirect_to templates_url
	end



	private
		def find_template
			@template = Template.find_by(params[:id])
		end

		def template_params
			params.require(:template).permit(:name, :body)
		end

end
