class AddColumnToTableParkingSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :parking_spots, :location, :string
  end
end
