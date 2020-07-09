class ChangeColumnsInStatusTables < ActiveRecord::Migration[5.2]
  def change
    change_column :statuses, :parking_spot, :integer
    change_column :statuses, :driver, :integer
  end
end
