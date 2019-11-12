class Summary < ApplicationRecord
    belongs_to :book
    belongs_to :user
    has_many :comments

    def username
        self.user.username
    end
    
end
