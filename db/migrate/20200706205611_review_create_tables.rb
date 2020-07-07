class ReviewCreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :text_body
      t.float :rating
      t.integer :dealership_id
      t.integer :client_id
      t.timestamps 
    end
  end
end
