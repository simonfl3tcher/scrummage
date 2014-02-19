class Task < ActiveRecord::Base
	belongs_to :project

	validates :name, presence: true
	validates :type_of_task, presence: true
	validates :project_id, presence: true
end