class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :commentState
      t.date :commentDate
      t.belongs_to :feature, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
