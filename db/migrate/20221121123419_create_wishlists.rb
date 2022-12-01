class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.references :user, null: false
      t.references :plant, null: false

      t.timestamps
    end
    add_foreign_key :wishlists, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :wishlists, :plants, column: :plant_id, on_delete: :cascade
  end
end
