class BookmarksController < ApplicationController
    before_action :authenticate_user!
    def create
        @trick = Trick.find(params[:trick_id])
        @bookmark = current_user.bookmarks.build(trick: @trick)
        @bookmark.save
        
        
        # if @bookmark.save
        #  redirect_to bookmarks_path
        # else
        #  redirect_to bookmarks_path
        # end
        
        respond_to do |format|
        #   format.html
          format.js 
        end
    end
    
    def index
        @user = current_user
        @bookmarks = current_user.bookmarks
    end
    
    def destroy
         @bookmark = Bookmark.find(params[:id])
        if @bookmark.destroy
          redirect_back(fallback_location: root_url)
        end
  
    end
end
