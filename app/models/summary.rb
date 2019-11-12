class Summary < ApplicationRecord
    belongs_to :book
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: { maximum: 12 }
    accepts_nested_attributes_for :comments

    def username
        self.user.username
    end

end
