class CreateReservationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :time
      t.integer :party_size
      t.text :reservation_notes
      t.integer :guest_id
      t.integer :restaurant_id
    end
  end
end
