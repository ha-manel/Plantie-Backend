class ChangeWaterColumn < ActiveRecord::Migration[7.0]
  def change
    change_column(:plants, :water, :string)
  end
end
