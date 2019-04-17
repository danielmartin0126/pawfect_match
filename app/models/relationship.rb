class Relationship < ApplicationRecord
    has_many :user

    def relationships
        Relationship.where("sender_id = ? OR receiver_id = ?", self.id, self.id)

    end

end
