class CreateTableStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :parking_spot
      t.string :driver
  end
end
end