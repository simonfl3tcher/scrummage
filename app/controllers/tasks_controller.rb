class TasksController < ApplicationController 

	respond_to :json 

	def create 
		@task = Task.new(task_params)
		if !@task.save
			respond_with(@task)
		end
	end

	private 

	def task_params
		params.require(:task).permit(:name, :description, :type_of_task, :project_id)
	end

end