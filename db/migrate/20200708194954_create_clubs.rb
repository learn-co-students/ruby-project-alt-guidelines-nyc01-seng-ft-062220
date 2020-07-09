class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name_of_club
      t.string :about_club
      t.integer :current_size
      t.integer :member_capacity
      t.string :meetings_day
      t.integer :attendence
    end
  end
end
