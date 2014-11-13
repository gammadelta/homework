class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.text :message
      t.integer :recever


      t.timestamps
    end
  end
end
