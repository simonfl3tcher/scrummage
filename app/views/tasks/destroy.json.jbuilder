json.id @task.id
json.name @task.name
json.description @task.description
json.project_id @task.project_id
json.created_at time_ago_in_words(@task.created_at)
json.testing '12312321'