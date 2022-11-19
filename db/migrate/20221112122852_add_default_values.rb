class AddDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :plants, :new, false
    change_column_default :plants, :trending, false
    change_column_default :plants, :discount, 0
  end
end
