class Post < ApplicationRecord
has_many :comments
belongs_to :user, foreign_key: :animal_id
end
