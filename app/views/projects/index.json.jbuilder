json.array! @projects do |project|
	json.id project.id
	json.user_id project.user_id
	json.name project.name
	json.project_type project.project_type
	json.description project.description
end