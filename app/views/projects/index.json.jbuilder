json.array! @projects do |project|
	json.id project.id
	json.user_id project.user_id
	json.name project.name
	json.project_type project.project_type
	json.description project.description
	json.created_at time_ago_in_words(project.created_at)
	json.tasks_count project.tasks.size
end