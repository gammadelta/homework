class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.text :message
      t.string :subject
      t.integer :recever
      t.boolean :opened


      t.timestamps
    end
  end
end
