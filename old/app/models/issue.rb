class Issue < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end
