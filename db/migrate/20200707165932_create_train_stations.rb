class CreateTrainStations < ActiveRecord::Migration[5.2]
  def change
    create_table :train_stations do |t|
      t.string :name
      t.string :stop_id
      t.string :next_departure_route_id 
      t.datetime :next_departure_time
    end
  end
end
