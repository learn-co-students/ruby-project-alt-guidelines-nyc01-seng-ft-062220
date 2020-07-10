class DealershipCreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :brand
      t.string :location
      t.integer :phone
    end
  end
end
