class Summary < ApplicationRecord
    belongs_to :book
    belongs_to :user
    has_many :likes
    has_many :comments, dependent: :destroy
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

    def book_title
        self.book.title
    end

    def like_count
        self.likes.count
    end

    def liked?(user)
        if Like.find_by(summary_id: self.id, user_id: user.id)
            return true
        else
            return false
        end
    end

end
