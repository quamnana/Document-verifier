class TemplatesController < ApplicationController
before_action :find_template, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]

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
		@template.user = current_user

		if @template.save
			flash[:notice] = "Success"
			redirect_to @template
		else
			flash.now[:alert] = "Failure"
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
			flash.now[:alert] = "Failure"
			render 'edit'
		end
	end

	def destroy
		@template.destroy
		flash.now[:alert] = "Deleted"
		redirect_to templates_url
	end



	private
		def find_template
			@template = Template.find(params[:id])
		end

		def template_params
			params.require(:template).permit(:name, :body)
		end

end
