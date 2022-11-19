class RenameTypeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :plants, :type, :habitat
  end
end
