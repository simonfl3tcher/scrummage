class AddProjects < ActiveRecord::Migration
  def change
  	 create_table :projects do |t|
	      t.string :name,           :null => false
	      t.string :project_type,   :null => false
	      t.string :description,	:null => false
	      t.integer :user_id,       :null => false
	      t.integer :created_by,    :null => false

	      t.timestamps
	  end
  end
end