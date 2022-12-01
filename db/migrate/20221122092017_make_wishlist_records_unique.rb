class MakeWishlistRecordsUnique < ActiveRecord::Migration[7.0]
  def change
    add_index :wishlists, [:user_id, :plant_id], unique: true
  end
end
