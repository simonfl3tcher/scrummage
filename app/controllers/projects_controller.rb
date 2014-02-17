class ProjectsController < ApplicationController

	respond_to :json 

	before_filter :authenticated, only: [:create]

	def index 
		@projects = Project.all
	end

	def show 
		project = Project.find(params[:id])
		respond_with(project)
	end

	private 

	def project_params
		params.require(:project).permit(:name, :project_tye, :description, :user_id, :created_by)
	end

	def authenticated
		if cannot? :create, Project 
			render status: :forbidden, text: "Forbidden"
		end
	end

end