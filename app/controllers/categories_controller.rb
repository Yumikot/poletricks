class CategoriesController < ApplicationController
    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to trick_path(@trick)
        else
            render 'new'
        end
    end
    def destroy
    end
    
    private
        def category_params
             params.require(category).permit(:category_name,:id)
        end
     
end
