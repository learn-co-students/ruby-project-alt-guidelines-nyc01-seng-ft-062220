class AddColumnInTableParkingSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :parking_spots, :time, :string
  end
end
