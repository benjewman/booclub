class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    accepts_nested_attributes_for :books
    validates :first_name, presence: true, length: { minimum: 1 }
    validates :last_name, presence: true, length: { minimum: 1 }

    def proper_name
        self.first_name.capitalize!
        self.last_name.capitalize!
    end
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
