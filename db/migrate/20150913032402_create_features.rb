class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :tittle
      t.string :price
      t.date :publicationDate
      t.string :publicationState
      t.string :description
      t.integer :flaggings_count
      t.integer :totalLikes
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.timestamps null: false
    end

     add_attachment :features, :image
  end
end
