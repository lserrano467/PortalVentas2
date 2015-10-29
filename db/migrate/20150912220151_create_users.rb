class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.string :userName
      t.string :email
      t.string :phone
      t.string :userType
      t.integer :flaggings_count
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.timestamps null: false
    end
  end
end