class CategoriesController < ApplicationController
    
    def create
        category = Category.create(category_params)
        if category.valid?
            app_response(status: :created, data: category)
        else
            app_response(status: :unprocessable_entity, data: category.errors.full_messages, message: 'failed')
        end
    end

    def destroy
        Category.find(params[:id]).destroy
        app_response(message: 'success', data: { info: 'deleted category successfully' }, status: 204)
    end

    def index
        categories = Category.all
        app_response(message: 'success', data: categories)
    end

    private

    def category_params
        params.permit(:name, :description)
    end
end
