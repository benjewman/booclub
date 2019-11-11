class AuthorsController < ApplicationController

    def index
        @authors = Author.all
    end
    
    def show
        find_author
        @books = @author.books
    end


    private
        def find_author
            @author = Author.find(params[:id])
        end

end
