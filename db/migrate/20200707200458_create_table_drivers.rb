class CreateTableDrivers < ActiveRecord::Migration[5.2]
  def change 
    create_table :drivers do |t|
      t.string :name
      t.string :car
  end
end
end
