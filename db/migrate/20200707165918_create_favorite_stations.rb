class CreateFavoriteStations < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stations do |t|
      t.integer :user_id
      t.integer :train_station_id
    end
  end
end
