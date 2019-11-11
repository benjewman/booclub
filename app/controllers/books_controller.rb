class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        find_book
        @author = @book.author
    end


    private
        def find_book
            @book = Book.find(params[:id])
        end
end
