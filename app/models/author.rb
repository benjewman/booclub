class Author < ApplicationRecord
    has_many :books
    accepts_nested_attributes_for :books
    def full_name
        self.first_name + " " + self.last_name
    end

    def order_last_name
        self.last_name + ", " + self.first_name
    end
    
    def book_count
        self.books.count
    end

    def self.all_count
        self.all.count
    end
end
