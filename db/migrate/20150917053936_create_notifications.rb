class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notification
      t.date :notificationDate
      t.belongs_to :feature, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
