class User < ApplicationRecord
    has_many :summaries
    has_many :comments
    has_many :books, through: :summaries
end
