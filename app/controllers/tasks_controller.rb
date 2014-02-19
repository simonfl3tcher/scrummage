class TasksController < ApplicationController

	respond_to :json 

	def create 
		@task = Task.new(task_params)
		@task.save
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
	end

	def update 
		@task = Task.find(params[:id])
		@task.update_attributes(task_params)
	end

	def show 
		@task = Task.find(params[:id])
	end

	private 

	def task_params
		params.require(:task).permit(:name, :description, :task_type, :project_id)
	end	

end