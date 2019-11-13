class Book < ApplicationRecord
    belongs_to :author
    has_many :summaries
    has_many :comments, through: :summaries
    has_many :users, through: :summaries
    accepts_nested_attributes_for :summaries
    accepts_nested_attributes_for :author

    def author_last_name
        self.author.last_name
    end

    def author_full_name
        self.author.full_name
    end
    def self.alphabetize_by_author
        array = self.all
        array.sort_by { |book| book.author_last_name }
    end

    def summary_count 
        self.summaries.count
    end

    def summary_order
        summaries.sort_by { |summary| -summary.like_count }
    end

end
