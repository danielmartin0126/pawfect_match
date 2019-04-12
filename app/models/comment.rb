class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user, through: :post

end
