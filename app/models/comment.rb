class Comment < ApplicationRecord
    belongs_to :summary
    belongs_to :user

    def username
        self.user.username
    end
end
