class CreateSubsubjects < ActiveRecord::Migration
  def change
    create_table :subsubjects do |t|
      t.string :name
      t.integer :subjectID

      t.timestamps
    end
  end
end
