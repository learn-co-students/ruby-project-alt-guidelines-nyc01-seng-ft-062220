class ClubMember < ActiveRecord::Base
    belongs_to :clubs_id
    belongs_to :members_id
end