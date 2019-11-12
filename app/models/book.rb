class Book < ApplicationRecord
    belongs_to :author
    has_many :summaries
    has_many :users, through: :summaries
    accepts_nested_attributes_for :summaries

    def author_last_name
        self.author.last_name
    end
    def self.alphabetize_by_author
        array = self.all
        array.sort_by { |book| book.author_last_name }
    end
end
