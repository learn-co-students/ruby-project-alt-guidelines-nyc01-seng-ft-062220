class ClientCreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :phone
    end
  end
end
