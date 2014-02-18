class ProjectsController < ApplicationController

	respond_to :json 

	def index 
		@projects = Project.all
	end

	def show 
		project = Project.find(params[:id])
		respond_with(project)
	end

	def create 
		project = Project.new(project_params)
		project.save
		respond_with(project)
	end

	def destroy 
		project = Project.find(params[:id])
		project.destroy
		respond_with(project)
	end

	private 

	def project_params
		params.require(:project).permit(:name, :project_type, :description, :user_id, :created_by)
	end

end