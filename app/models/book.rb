class Book < ApplicationRecord
    belongs_to :author
    has_many :summaries
    has_many :users, through: :summaries
end
