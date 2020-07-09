class CreateClubMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :club_members do |t|
      t.integer :club
      t.integer :member
    end
  end
end
