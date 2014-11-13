class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.integer :UID
    	t.integer :assignmentID
    	t.string :response
    	t.boolean :selected
    	
      t.timestamps
    end
  end
end
