class ChangeDiscountType < ActiveRecord::Migration[7.0]
  def change
    change_column(:plants, :discount, :decimal)
  end
end
