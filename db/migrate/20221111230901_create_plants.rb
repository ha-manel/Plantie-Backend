class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :type
      t.boolean :new
      t.boolean :trending
      t.integer :discount
      t.integer :water
      t.decimal :size

      t.timestamps
    end
  end
end
