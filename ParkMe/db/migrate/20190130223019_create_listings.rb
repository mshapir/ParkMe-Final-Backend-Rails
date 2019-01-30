class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :location
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
