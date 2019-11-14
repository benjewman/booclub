class Like < ApplicationRecord
    belongs_to :user
    belongs_to :summary
    has_one :book, through: :summary
    validates :summary_id, uniqueness: { scope: :user_id }
end
