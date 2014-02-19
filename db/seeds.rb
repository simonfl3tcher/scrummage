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


Task.create(:name => 'Task 1', :type_of_task => 'This is a single task', :description => 'This is a task', :project_id => 1)
Task.create(:name => 'Task 2', :type_of_task => 'This is a 2 task', :description => 'This is a task', :project_id => 1)
Task.create(:name => 'Task 3', :type_of_task => 'This is a 3 task', :description => 'This is a task', :project_id => 1)