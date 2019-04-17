class User < ApplicationRecord
    has_many :relationships
    has_many :posts, foreign_key: :animal_id
    has_many :comments
    has_many :comments, through: :posts



    def partners
        @partners = self.relationships.map do |relationship|
            User.find(relationship.so_user_id)
        end
    end

    def m_f
        if self.gender == true
            "Female"
        else
            "Male"
        end
    end

    def messages
        Message.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
    end

    def self.species_list
      User.all.map do |user|
        user.species
      end
    end

    def self.search(term)
        if User.species_list.include?(term)
          species = User.find_by(species: term)
          where('species = ?',  "#{term}")
        else
          all
        end
    end

end
