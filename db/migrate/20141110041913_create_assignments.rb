class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.integer :UID
    	t.boolean :completed 
    	t.string :description 
    	t.integer :points
    	t.integer :doneBy
    	t.string :answer
    	t.integer :subsubject


      t.timestamps
    end
  end
end
