class Project < ActiveRecord::Base
	has_many :tasks
	belongs_to :user
	validates :name, presence: true, uniqueness: {message: "Project name already exists"}
end
