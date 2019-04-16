class Post < ApplicationRecord
has_many :comments
belongs_to :user, foreign_key: :animal_id

validates :image_url, presence: true
validates :caption, presence: true

end
