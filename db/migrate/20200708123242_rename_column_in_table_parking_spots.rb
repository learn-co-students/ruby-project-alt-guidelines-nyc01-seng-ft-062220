class RenameColumnInTableParkingSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :parking_spots, :location, :available
  end
end
