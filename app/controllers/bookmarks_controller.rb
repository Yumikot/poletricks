class BookmarksController < ApplicationController
    def create
        # @user_id = current_user.id
        # @trick_id = Trick.find(params[:id]).id
        @trick = Trick.find(params[:trick_id])
        # @bookmark = Bookmark.new(trick_id: @trick_id, user_id: @user_id)
        @bookmark = current_user.bookmarks.build(trick: @trick)
        
        if @bookmark.save
         redirect_to bookmarks_path
        else
         redirect_to bookmarks_path
        end
    end
    
    def index
        @user = current_user
        # @bookmarks = Bookmark.where(user_id: @user.id).all
        @bookmarks = current_user.bookmarks
    end
    
    def destroy
         @bookmark = Bookmark.find(params[:id])
        if @bookmark.destroy
          #redirect_to user_path(current_user)
          redirect_back(fallback_location: root_url)
        end
  
    end
end
