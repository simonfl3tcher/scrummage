# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create(:name => 'Elanco', :project_type => 'Bespoke Application', :description => 'Nothing to say here', :user_id => 1, :created_by => 1)
Project.create(:name => 'IPIC', :project_type => 'Bespoke Application', :description => 'Nothing to say here', :user_id => 1, :created_by => 1)
Project.create(:name => 'Stowhealth', :project_type => 'Bespoke Application', :description => 'Nothing to say here', :user_id => 1, :created_by => 1)
Project.create(:name => 'Just Dental', :project_type => 'Bespoke Application', :description => 'Nothing to say here', :user_id => 1, :created_by => 1)

Task.create( name: "Task 1", description: "THis is a task description", task_type: "Bug", :project_id => 1 )
Task.create( name: "Task 2", description: "THis is a task description", task_type: "New Feature", :project_id => 1 )

