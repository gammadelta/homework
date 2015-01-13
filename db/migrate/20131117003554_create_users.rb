class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.integer :points
      t.integer :rating
      t.boolean :banned 


      t.timestamps
    end
  end
end