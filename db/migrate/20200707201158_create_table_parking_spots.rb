class CreateTableParkingSpots < ActiveRecord::Migration[5.2]
  def change 
    create_table :parking_spots do |t|
      t.string :location
      t.string :status 
  end
end
end
