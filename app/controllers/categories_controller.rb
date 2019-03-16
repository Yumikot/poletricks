class CategoriesController < ApplicationController
    def create
    end
    def destroy
    end
     private
     def category_params
         params.require(category).permit(:category_name)
     end
     
end
