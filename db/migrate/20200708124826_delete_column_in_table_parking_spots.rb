class DeleteColumnInTableParkingSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_spots, :status
  end
end
