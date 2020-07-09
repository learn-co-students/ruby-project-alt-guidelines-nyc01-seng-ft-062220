class ChangeColumnNamesInStatusTables < ActiveRecord::Migration[5.2]
  def change
    rename_column :statuses, :parking_spot, :parking_spot_id
    rename_column :statuses, :driver, :driver_id
  end
end
