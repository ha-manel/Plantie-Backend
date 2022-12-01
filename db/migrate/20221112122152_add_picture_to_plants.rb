class AddPictureToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :picture, :string
  end
end
