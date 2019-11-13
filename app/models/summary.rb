class Summary < ApplicationRecord
    belongs_to :book
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: { maximum: 12 }
    accepts_nested_attributes_for :comments

    def username
        self.user.username
    end

    def character_count
        self.content.length
    end

    def comment_count
        self.comments.count
    end

end
