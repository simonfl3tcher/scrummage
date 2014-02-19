class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :task_type
      t.text :description
      t.references :project

      t.timestamps
    end
  end
end
