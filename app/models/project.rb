class Project < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, uniqueness: {message: "Project name already exists"}
end
