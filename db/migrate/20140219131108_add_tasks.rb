class AddTasks < ActiveRecord::Migration
  def change
  	create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :type_of_task
      t.references :project, index: true

      t.timestamps
    end
  end
end
