class AuthorsController < ApplicationController
    
    def create
        author = Author.create(author_params)
        if author.valid?
            app_response(status: :created, data: author)
        else
            app_response(status: :unprocessable_entity, data: author.errors.full_messages, message: 'failed')
        end
    end

    def destroy
        Author.find(params[:id]).destroy
        app_response(message: 'success', data: { info: 'deleted author successfully' }, status: 204)
    end

    def index
        authors = Author.all
        app_response(message: 'success', data: authors)
    end

    private

    def author_params
        params.permit(:name, :bio)
    end
end
