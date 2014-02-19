json.id @project.id
json.name @project.name
json.project_type @project.project_type
json.description @project.description

json.tasks @project.tasks do |task|
	json.id task.id
	json.name task.name
	json.type_of_task task.type_of_task
	json.description task.description
	json.created_at time_ago_in_words(task.created_at)
end