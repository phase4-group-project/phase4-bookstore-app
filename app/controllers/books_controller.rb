class BooksController < ApplicationController
    before_action :session_expired?

    def create
        book = user.books.create(book_params)
        if book.valid?
            app_response(status: :created, data: book)
        else
            app_response(status: :unprocessable_entity, data: book.errors.full_messages, message: 'failed')
        end
    end

    def update
        book = user.books.find(params[:id]).update(book_params)
        if book
            app_response(data: { info: 'updated book successfully' }, status: :ok)
        else
            app_response(message: 'failed', data: { info: 'something went wrong. could not update book' }, status: :unprocessable_entity)
        end
    end

    def destroy
        user.books.find(params[:id]).destroy
        app_response(message: 'success', data: { info: 'deleted book successfully' }, status: 204)
    end

    def index
        books = Book.all
        app_response(message: 'success', data: books)
    end

    private

    def book_params
        params.permit(:title, :description, :price, :author)
    end

end
