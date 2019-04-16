class Message < ApplicationRecord
    belongs_to :user, foreign_key: :sender_id
    belongs_to :user, foreign_key: :receiver_id

    validates :msg, presence: true
    validates :receiver_id, presence: true


end
