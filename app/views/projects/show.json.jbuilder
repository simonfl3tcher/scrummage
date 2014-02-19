json.id @project.id
json.name @project.name
json.description @project.description
json.project_type @project.project_type

json.tasks @project.tasks do |task|
	json.id task.id
	json.name task.name
	json.description task.description
	json.task_type task.task_type
	json.created_at time_ago_in_words(task.created_at)
end