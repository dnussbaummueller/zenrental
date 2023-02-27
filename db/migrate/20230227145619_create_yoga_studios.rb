class CreateYogaStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :yoga_studios do |t|
      t.string :name
      t.string :address
      t.float :price_per_hour
      t.integer :size_in_m2
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
