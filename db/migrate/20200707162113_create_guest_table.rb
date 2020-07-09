class CreateGuestTable < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.text :guest_notes
    end
  end
end
