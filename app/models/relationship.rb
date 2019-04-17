class Relationship < ApplicationRecord
    has_many :user

    validate :unique_relationship

    def relationships
        Relationship.where("sender_id = ? OR receiver_id = ?", self.id, self.id)

    end

    def unique_relationship
        if Relationship.find_by(user_id: self.user_id, so_user_id: self.so_user_id)
            errors.add(:user_id, "already sniffing out #{User.find(self.so_user_id).name}")
        end
    end 
end
