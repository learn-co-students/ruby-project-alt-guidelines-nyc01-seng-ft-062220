class RenameClubMembersColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :club_members, :club, :club_id
    rename_column :club_members, :member, :member_id
  end
end
