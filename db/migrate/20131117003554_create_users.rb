class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.string :userName
      t.integer :points
      t.integer :rating
      t.boolean :banned 


      t.timestamps
    end
  end
end