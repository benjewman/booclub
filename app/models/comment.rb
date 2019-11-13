class Comment < ApplicationRecord
    belongs_to :summary
    belongs_to :user
    has_one :book, through: :summary

    def username
        self.user.username
    end
end
