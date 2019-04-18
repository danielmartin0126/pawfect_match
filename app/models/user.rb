class User < ApplicationRecord
    has_secure_password
    
    has_many :relationships
    has_many :posts, foreign_key: :animal_id
    has_many :comments
    has_many :comments, through: :posts

    validates :name, uniqueness: true
    validates :species, presence: true
    validates :age, numericality: true
    validates :quote, presence: true
    validates :fav_food, presence: true
    validates :gender, inclusion: {in: [true,false]}
    validates :interests, presence: true
    validates :profile_pic, presence: true



    def partners
      Relationship.where("user_id = ?", self.id).map do |relationship|
        User.find(relationship.so_user_id)
      end
    end

    def relationships
        Relationship.where("user_id = ? OR so_user_id = ?", self.id, self.id)
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

    def authenticate(pt_pw)
      if BCrypt::Password.new(self.password_digest) == pt_pw
        true
      end
    end
end
