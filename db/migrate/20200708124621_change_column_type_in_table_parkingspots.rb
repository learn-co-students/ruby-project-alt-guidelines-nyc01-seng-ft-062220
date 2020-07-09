class ChangeColumnTypeInTableParkingspots < ActiveRecord::Migration[5.2]
  def change
    change_column :parking_spots, :available, :boolean
  end
end
