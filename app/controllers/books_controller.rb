class BooksController < ApplicationController
    def index
        @books = Book.alphabetize_by_author
    end

    def show
        find_book
        @author = @book.author
        @summaries = @book.summaries
    end


    private
        def find_book
            @book = Book.find(params[:id])
        end
end
