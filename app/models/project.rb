class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	validates :name, presence: true, uniqueness: {message: "Project name already exists"}
end
